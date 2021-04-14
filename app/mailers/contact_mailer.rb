class ContactMailer < ApplicationMailer
  default from: "Wreckhouse Press <no-reply@wreckhousepress.com>"
  def send_about_email
      @email = params[:email]
     @email_body = params[:email_body]
  mail(to: "info@wreckhousepress.com",
       subject: "General Inquiry",
       bcc: ["wreckhousepress.utility@gmail.com"])
  end

  def send_publishing_email
     @email = params[:email]
     @email_body = params[:email_body]
  mail(to: 'info@wreckhousepress.com',
       subject: "Publishing Inquiry",
       bcc: ["wreckhousepress.utility@gmail.com"])
  end
  def send_advertising_email
       @email = params[:email]
       @email_body = params[:email_body]
  mail(to: "info@wreckhousepress.com",
       subject: "Advertising Inquiry",
       bcc: ["wreckhousepress.utility@gmail.com"])
end
end

