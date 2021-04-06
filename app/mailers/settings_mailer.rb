class SettingsMailer < ApplicationMailer
  default from: "Wreckhouse Team <no-reply@wreckhousepress.com>"

  def password
    email = params[:email]
    mail(to: "#{email}",
         subject: "New Password Confirmation")
  end

  def email
    email = params[:email]
    mail(to: "#{email}",
         subject: "New Email Confirmation")
  end

  def delete
    email = params[:email]
    mail(to: "#{email}",
         subject: "Account Deletion Confirmation")
  end

  def cancel
    email = params[:email]
    mail(to: "#{email}",
         subject: "Canceled Subscription Confirmation")
  end

  def notify_cancel
    @email = params[:email]
    mail(to: "kylemcloughlindev@gmail.com",
         subject: "LEGACY SUBSCRIPTION CANCEL")
  end

  def notify_delete
    @email = params[:email]
  mail(to: "kylemcloughlindev@gmail.com",
     subject: "LEGACY ACCOUNT DELETE")
  end
end
