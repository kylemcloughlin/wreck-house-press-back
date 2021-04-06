class ContactMailer < ApplicationMailer
  default from: "Wreckhouse Team <no-reply@wreckhousepress.com>"
  def send_about_email
      @email = params[:email]
     @email_body = params[:email_body]
  mail(to: "wreckhousepress.utility@gmail.com",
       subject: "General Inquiry",
       bcc: ["kylemcloughlin00@gmail.com"])
  end

  def send_publishing_email
     @email = params[:email]
     @email_body = params[:email_body]
  mail(to: 'wreckhousepress.utility@gmail.com',
       subject: "Publishing Inquiry",
       bcc: ["kylemcloughlin00@gmail.com"])
  end
  def send_advertising_email
       @email = params[:email]
       @email_body = params[:email_body]
  mail(to: "wreckhousepress.utility@gmail.com",
       subject: "Advertising Inquiry",
       bcc: ["kylemcloughlin00@gmail.com"])
end
end
