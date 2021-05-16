class UsersController < ApplicationController
  require "stripe"
  Stripe.api_key=  ENV["API_KEY"]
# ENV["API_KEY"]
  before_action :set_user, only: [:show, :update, :destroy]


  # POST /users
  def create
    # byebug
    @user = User.create!(
      email: params['user']['email'],
      password: params['user']['password'],
      password_confirmation: params['user']['password_confirmation'],
      c_id: nil,
      admin: false,
      legacy: false,
      
    )
    if @user
      payload = {user_id: @user.id}
      token = create_token(payload)
      NotifierMailer.with({email: @user.email}).welcome.deliver_now
      render  locals:{token: token}, json: { logged_in: true, user: @user, token: token }, status: :created
    else
      render json: {status: 500}
    end
  end

  # PATCH/PUT /users/1
  def update
    isWhat = params[:x][:update]
    if isWhat == 'email'
      puts 'hit'
      email = params[:x][:email]
      @user.email = email
      
    else
      @user.password = params[:x][:new_password]
      @user.password_confirmation = params[:x][:new_password_confirmation]
    end
    if @user.save
      if isWhat == 'email'
        if @user.c_id
          Stripe::Customer.update( @user.c_id,{ email: @user.email})
        end
         SettingsMailer.with({ email: @user.email }).email.deliver_now
        else
         SettingsMailer.with({email: @user.email}).password.deliver_now
       end
      render json: @user, status: :ok
    else
      render json:  @user.error, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
       found = User.find_by(email: params[:x][:email]).try(:authenticate, params[:x][:password])
    if found == @user
      puts 'hit'
      if @user.s_id
      Stripe::Subscription.delete(@user.s_id) 
      end
      if @user.legacy
      SettingsMailer.with({ email: params[:x][:email] }).notify_delete.deliver_now
      end
      if @user.destroy
      SettingsMailer.with({ email: params[:x][:email] }).delete.deliver_now
      render json: @user, status: :ok   
    else
      puts 'else'
      render json: @user, status: :unprocessable_entity
    end
  end
end 
  def rescue 
    puts params[:email]
    
      user = User.find_by(email: params[:email])
    if user
      render json: {
        alert: "If this user exists, we have sent you a password reset email."
      }
      user.send_password_reset
    else
      #this sends regardless of whether there's an email in database for security reasons
      render json: {
        alert: "If this user exists, we have sent you a password reset email."
      }
    end
  end
  def token_check 
    user = User.find_by(password_reset_token: params[:token])
    if user.present? 
    render status: :ok
else
  render json: { error: ["Link not valid or expired. Try generating a new link."] }, status: :not_found
end
  end 

  def reset
    user = User.find_by(password_reset_token: params[:token])
    if user.present? && user.password_token_valid?
      if user.reset_password(params[:password])
        render status: :ok
       
      else
        render json: { error: user.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: {error:  ['Link not valid or expired. Try generating a new link.']}, status: :not_found
    end
  end
  def over_ride
    params[:email] 
    user = User.find_by(email: params[:email])
    if user.present?
    render json: {c_id: user.c_id, s_id:user.s_id, admin: user.admin, expiry: user.expiry}, status: :ok
      else
        render status: :unprocessable_entity
      end    
  end
def over_ride_update
  email = params[:email]
  admin = params[:admin]
  expiry = params[:subscription]
  user = User.find_by(email: email)

  if admin === 'opposite'
    opp = !user.admin
    user.admin = opp 
  end
case expiry
when '3'
  date = Date.today + 3.months
  user.expiry = date

when '6'
 date = Date.today + 6.months
user.expiry = date
else
user.expiry = 'annual'
end
    if user.save
      render json: user, status: :ok
    else
      render json:  user.error, status: :unprocessable_entity
    end
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:email, :password_digest)
    end
end
