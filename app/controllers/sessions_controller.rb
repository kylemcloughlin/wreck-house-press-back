class SessionsController < ApplicationController
  attr_accessor :data 
  attr_reader :session_id
 before_action :set_current_user, only: [:show, :update, :destroy, :get, :logged_in]
  def create

    user = User.find_by(email: params["email"]).try(:authenticate, params["password"])
    if user
      session[:data] = user.id
      puts "user id:::::::==>#{session[:user_id]}"
puts "data:::::::==>#{session[:data]}"
puts "session_id:::::::==>#{session[:session_id]}"
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
puts "user id:::::::==>#{session[:user_id]}"
puts "data:::::::==>#{session[:data]}"
puts "session_id:::::::==>#{session[:session_id]}"
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

        session[:data] = nil
        render json: { status: 200, logged_in: false}
  end
  private

# Use callbacks to share common setup or constraints between actions.
 def set_current_user 
puts "user id:::::::==>#{session[:user_id]}"
puts "data:::::::==>#{session[:data]}"
puts "session_id:::::::==>#{session[:session_id]}"
  if session[:session_id] 
    puts "::whithtih:::::==>#{session[:data]}"
      test = self.find_by_session_id(session_id) 
      puts "omgomgomg#{test}"
    @current_user = User.find(session[:data])
    end
end

# Only allow a trusted parameter "white list" through.
def user_params
  params.require(:user).permit(:email, :password_digest)
end
end
