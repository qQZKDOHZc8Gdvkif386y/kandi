class ChargesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    Stripe.api_key = "sk_test_Widu46M8PLwx1D7Z8qNJehg0"

    # Get the credit card details submitted by the form
    token = params[:stripeToken]

    charge = Stripe::Charge.create(
        :amount => 1000,
        :currency => 'usd',
        :source => token,
        :description => 'BedKandi180'
    )

    order = nil

    if current_user
      order = Order.create(user_id: current_user.id, email: params[:email], status: 'billed', total: @cart.total)
    else
      order = Order.create(email: params[:email], status: 'billed', total: @cart.total)
    end

    @cart.shopping_cart_items.all.each do |item|
      order.order_products.create(order_id: order.id, product_id: item.item_id)
    end

    @cart.shopping_cart_items.destroy_all

    render 'success'
  end
end