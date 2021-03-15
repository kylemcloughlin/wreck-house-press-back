class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # POST /users
  def create
    @user = User.create!(
     email: params['user']['email'],
      password: params['user']['password'],
      password_confirmation: params['user']['password_confrimation']
    )
      
    if @user

      # NotifierMailer.with(@user).welcome.deliver
      payload = {user_id: @user.id}
      token = create_token(payload)

      render  locals:{token: token}, json: { logged_in: true, user: @user, token: token }, status: :created
    else
      render json: {status: 500}
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_user
    #   @user = User.find(params[:id])
    # end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:email, :password_digest)
    end
end
