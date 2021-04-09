class CustomersController < ApplicationController
  require "stripe"
  Stripe.api_key= ENV["API_KEY"]


  def create
    begin
      tax_rate = Stripe::TaxRate.create({
        display_name: "HST",
        inclusive: false,
        percentage: 15,
        country: "CA",
        jurisdiction: "CA - NL",
        description: "HST",
      })

      customer = Stripe::Customer.create({
        payment_method: params[:payment_method],
        email: params[:email],
        name: params[:name],
        invoice_settings: {
          default_payment_method: params[:payment_method],
        },
      })

      decoded_token = JWT.decode(params[:bearer], secret)
      payload = decoded_token.first
      user_id = payload["user_id"]
      user = User.find(user_id)
      subcription = nil
      if params[:code] === "price_1IdzVwFLIGg7N7ZVCNQJ4sQE" 
        date = Date.today + 6.months
        subcription = Stripe::Subscription.create({
          customer: customer.id,
          cancel_at: date.strftime("%s"),
          items: [
            { price: params[:code], tax_rates: [tax_rate.id] },

          ],
          expand: ["latest_invoice.payment_intent"],
        })
        user[:expiry] = date.strftime("%d/%m/%Y")
      elsif params[:code] === "price_1IdzXrFLIGg7N7ZVPujKXYay"
        date = Date.today + 3.months
        subcription = Stripe::Subscription.create({
          customer: customer.id,
          cancel_at: date.strftime("%s"),
          items: [
            { price: params[:code], tax_rates: [tax_rate.id] },

          ],
          expand: ["latest_invoice.payment_intent"],
        })
        user[:expiry] = date.strftime("%d/%m/%Y")
      else
        subcription = Stripe::Subscription.create({
          customer: customer.id,
          items: [
            { price: params[:code], tax_rates: [tax_rate.id] },

          ],
          expand: ["latest_invoice.payment_intent"],
        })
        user[:expiry] = 'annual'
      end
      # byebug
      user[:c_id] = customer.id
      user[:s_id] = subcription.id
    
      data = { invoice_status: subcription[:latest_invoice][:status],
               invoice_total: subcription[:latest_invoice][:total],
               name: params[:name],
               invoice_number: subcription[:latest_invoice][:number],
               invoice_id: subcription[:latest_invoice][:id],
               hosted_invoice: subcription[:latest_invoice][:hosted_invoice_url],
               start: subcription[:latest_invoice][:period_start],
               end: subcription[:latest_invoice][:period_end] }

      if user.save
        NotifierMailer.with({ email: params[:email], data: data }).checkout.deliver_now
        render json: { customer: customer, subscription: subcription, id: customer.id, invoice_id: subcription[:latest_invoice][:id] }
      end
    rescue Stripe::CardError => e
      # puts "Status is: #{e.http_status}"
      # puts "Type is: #{e.error.type}"
      # puts "Charge ID is: #{e.error.charge}"
      # # The following fields are optional
      # puts "Code is: #{e.error.code}" if e.error.code
      # puts "Decline code is: #{e.error.decline_code}" if e.error.decline_code
      # puts "Param is: #{e.error.param}" if e.error.param
      # puts "Message is: #{e.error.message}" if e.error.message
      # byebug
      render json: e.error.message, status: e.http_status
    end
  end

  def destroy
    @User = User.find_by(email: params[:data][:email]).try(:authenticate, params[:data][:password])
    if !@User
      render render json: @User, status: 401
    else
      if @User.legacy
        @User.expiry = nil
        SettingsMailer.with({ email: @User.email }).notify_cancel.deliver_now
      end
      if @User.s_id
        begin
          suscription = Stripe::Subscription.delete(@User.s_id) # might be redundant to have this delete user

          ##### add this to to user delete to make sure subcription cancels
          SettingsMailer.with({ email: @User.email }).cancel.deliver_now
          @User.c_id = nil
          @User.s_id = nil
          @user.expiry = nil
          @User.save

          render json: { user: @User }, status: :ok
        rescue exception => e
          render json: e, status: 401
        end
      else
        render json: e, status: 404
      end
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:payment_method, :email, :code, :name, :address)
  end
end
