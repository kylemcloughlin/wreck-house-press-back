class NotifierMailer < ApplicationMailer
  default from:  "Wreckhouse Team <no-reply@wreckhousepress.com>"
      #   return_path: "system@example.com"
      
      
      
      
      def welcome
       email = params[:email]
       mail(to: "#{email}",
              subject: 'Welcome to WreckHouse Press',
              content_type: "text/html")
end

def rescue(user) 
    @user = user
    
#   email = user.email
mail(to: @user.email,
       subject: "New Password Confirmation",
              content_type: "text/html")
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
       subject: "Payment Confirmation - invoice #{@invoice_number}",
      content_type: "text/html")
      
end
def legacy(raw_user) 
       @raw_user = raw_user
       mail(to: @raw_user.email,
              subject: "Wreckhouse Press's New Website and Account Update",
              content_type: "text/html")

end

def weekly

@email = params[:email]
@pdf = params[:link]

       mail(to: @email,
              subject: "Wreckhouse Press Weekly ",
              content_type: "text/html")
end




end
