class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
  end

  def destroy
  end
end
