class SessionsController < ApplicationController
 before_action :set_current_user, only: [:show, :update, :destroy, :get, :logged_in]
  def create

    user = User.find_by(email: params["email"]).try(:authenticate, params["password"])
    if user
      session[:user_id] = user.id
      puts ":::::::==>#{session[:user_id]}"
      puts "hit?????"
      render json: {
        status: :created,
        logged_in: true,
        user: user
      }
    else
      render json: { status: 401}
  end
end
  def logged_in
puts ":::::::==>#{session[:user_id]}"
    if @current_user
       
      render json: { logged_in: true, user: @current_user }
    else
      render json: {
        logged_in: false, user: @current_user
      }
    end
  end 
  def destroy
        reset_session

        session[:user_id] = nil
        render json: { status: 200, logged_in: false}
  end
  private

# Use callbacks to share common setup or constraints between actions.
 def set_current_user 
 
  if session[:user_id] 
    puts ":::::::==>#{session[:user_id]}"
      @current_user = User.find(session[:user_id])
    end
end

# Only allow a trusted parameter "white list" through.
def user_params
  params.require(:user).permit(:email, :password_digest)
end
end
