class SettingsMailer < ApplicationMailer
  default from: "Wreckhouse Press <no-reply@wreckhousepress.com>"

  def password
    email = params[:email]
    mail(to: "#{email}",
         subject: "New Password Confirmation",
                       content_type: "text/html")
  end

  def email
    email = params[:email]
    mail(to: "#{email}",
         subject: "New Email Confirmation",
                content_type: "text/html")
  end

  def delete
    email = params[:email]
    mail(to: "#{email}",
         subject: "Account Deletion Confirmation",            
                        content_type: "text/html")
  end


  def cancel
    email = params[:email]
    mail(to: "#{email}",
         subject: "Canceled Subscription Confirmation",
           content_type: "text/html")
  end

  def notify_cancel
    @email = params[:email]
    mail(to: "kylemcloughlindev@gmail.com",
         subject: "LEGACY SUBSCRIPTION CANCEL",
           content_type: "text/html")
  end

  def notify_delete
    @email = params[:email]
  mail(to: "kylemcloughlindev@gmail.com",
     subject: "LEGACY ACCOUNT DELETE")
  end
end
