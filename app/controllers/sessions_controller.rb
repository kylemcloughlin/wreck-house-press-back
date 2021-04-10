class SessionsController < ApplicationController
#  skip_before_action :authenticate, only: [:create]
  def create
  begin
    @user = User.find_by(email: params["email"]).try(:authenticate, params["password"])
        payload ={user_id: @user.id}
        token = create_token(payload)
      render locals:{token: token}, json: {  logged_in: true, user: @user, token: token }, status: :created
    rescue => exception
    
    render error: {message: "Error! #{exception}"}, status: :forbidden
  end
end


  def logged_in
      if request.headers["Authorization"]

  begin
    auth_header = request.headers["Authorization"]
    decoded_token = JWT.decode(auth_header, secret)
    payload = decoded_token.first
    user_id = payload["user_id"]
   
    @user = User.find(user_id)

    render json: { logged_in: true, id: @user.id, expiry: @user.expiry, is: @user.admin}
  rescue => exception
    render json: {message: "Error! #{exception}"}, status: :forbidden
  end
else
  render json: { logged_in: false}
end
end
  def destroy
        
        # session[:user_id] = nil
        render json: { status: 200, logged_in: false}
  end
  private

# Use callbacks to share common setup or constraints between actions.
#  def set_current_user 
 
#   if session[:user_id] 
#     puts ":::::::==>#{session[:user_id]}"
#       @current_user = User.find(session[:user_id])
#     end
# end

# Only allow a trusted parameter "white list" through.
def user_params
  params.require(:user).permit(:email, :password_digest)
end
end
