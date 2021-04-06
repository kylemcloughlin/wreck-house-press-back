class ContactController < ApplicationController
  def create
    type =  params[:type]
     email = params[:email]
     email_body = params[:email_body]
    if type ==  'publishing'
      ContactMailer.with({ email: email, email_body: email_body }).send_publishing_email.deliver_now
      render  status: 200

    elsif type == 'ad'
      ContactMailer.with({ email: email, email_body: email_body }).send_advertising_email.deliver_now
      render status: 200
    else
      ContactMailer.with({email: email, email_body: email_body}).send_about_email.deliver_now
    render status: 200
    end
    # byebug
  end


#   def advertising
#     puts "hit adman"
# puts params
 
#   end
#   def publishing 
#     puts 'hit publishing'
#     puts params
 
#   end 

end
