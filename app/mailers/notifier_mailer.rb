class NotifierMailer < ApplicationMailer
  default from:  "Wreckhouse Team <no-reply@wreckhousepress.com>"
      #   return_path: "system@example.com"





def welcome
email = params[:email]
mail(to: "#{email}",
      subject: 'Welcome to WreckHouse Press')
end

def rescue(user) 
    puts params
    @user = user
    
#     byebug
#   email = user.email
mail(to: @user.email,
       subject: "New Password Confirmation")
end

def checkout
email = params[:email]
@invoice_status = params[:data][:invoice_status]
@invoice_total = params[:data][:invoice_total]
@name = params[:data][:name]
@invoice_number = params[:data][:invoice_number]
@hosted_invoice = params[:data][:hosted_invoice]
@date = params[:data][:end]

mail(to: "#{email}",
       subject: "Payment Confirmation - invoice #{@invoice_number}")
end

end
