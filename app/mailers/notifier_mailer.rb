class NotifierMailer < ApplicationMailer
  default from: "no-reply@example.com",
        return_path: "system@example.com"

def welcome
email = params[:email]
mail(to: email,
       bcc: ["kylemcloughlin00@gmail.com", "Order Watcher kylemcoughlindev@gmail.com"])
      end
end
