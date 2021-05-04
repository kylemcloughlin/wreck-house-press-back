class RawUsersController < ApplicationController
  before_action :set_raw_user, only: [:show, :update, :destroy]

  # GET /raw_users
  def index
    @raw_users = RawUser.all

    @raw_users.each do |user|
       puts "#{user}"
      user.send_password_reset
    end
    render status: :ok
  end


  # POST /raw_users
  def create

  
  raw_user = RawUser.find_by(token: params[:token])
if raw_user.present? 
  admin =  false
  user = User.create!({
              email: raw_user.email,
              expiry: raw_user.expiry,
              legacy: true,
              password: params['password'],
              password_confirmation: params['password_confirmation'],
              c_id: nil,
              admin: admin
  })
  if user.save
    puts 'hit save'
    raw_user.destroy!
    render status: :ok
  else
    puts 'hit'
    render json: { error: user.errors.full_messages }, status: :unprocessable_entity
  end
 else
    puts 'hit 2'

      render status: 404
end
  end


def new_email ##post
  if params[:subscription_length] === '3'
    date = Date.today + 3.months
    date = date.strftime("%d/%m/%Y")
  elsif params[:subscription_length] === '6'
    date = Date.today + 3.months
    date = date.strftime("%d/%m/%Y")
  else
    date = 'annual'
  end
  new_raw_user = RawUser.create(email: params[:email], expiry: date)
  new_raw_user.send_password_reset
 render json: { user: new_raw_user }, status: :ok

end






  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_raw_user
      @raw_user = RawUser.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def raw_user_params
      params.require(:raw_user).permit(:email, :expiry, :token)
    end
end
