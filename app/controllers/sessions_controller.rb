class SessionsController < ApplicationController
#  skip_before_action :authenticate, only: [:create]
  def create
    puts "hit"
    puts"params #{params}"
    puts "hit"
    @user = User.find_by(email: params["email"]).try(:authenticate, params["password"])
    puts "hit pre if"

    if @user
    puts "hit in  if"

        payload ={user_id: @user.id}
        # secret = ENV['SECRET_KEY_BASE'] || Rails.application.secrets.secret_key_base
    puts "hit pre token"

        token = create_token(payload)
    puts"hit pre token"
      render locals:{token: token}, json: {  logged_in: true, user: @user, token: token }, status: :created
    else
      render json: { }, status: 401
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
    render json: { logged_in: true}
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
