class CustomersController < ApplicationController
  require "stripe"
  Stripe.api_key = ENV["API_KEY"]
  # ActionController::Parameters.permit_all_parameters = true
  def create
    puts ENV['API_KEY']
    # byebug 
    puts params
    customer = Stripe::Customer.create({
      payment_method: params[:payment_method],
      email: params[:email],
      name:  params[:name],
      description:  params[:address],
      invoice_settings: {
        default_payment_method: params[:payment_method]
      }
      })
      
      # byebug
      subcription = Stripe::Subscription.create({
        customer: customer.id,
        items: [
          { price: params[:code] },
        ],
        expand: ["latest_invoice.payment_intent"]
        })
        

# rescue Stripe::CardError => e
#     render: { error: e.message }
# end
    render json: {  customer: customer, subscription: subcription }
  end


  private
def customer_params
  params.require(:customer).permit(:payment_method, :email, :code, :name, :address)
end
end
