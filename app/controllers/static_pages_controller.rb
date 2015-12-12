class StaticPagesController < ApplicationController
  def index
    @current_user = current_user
    @products = Product.take(3)
  end

  def store
    @products = Product.find_products(@category_id, @spicy_level, @per_page, @page)
  end

  def display
    @product = Product.find(params[:id])
  end

  def add_cart_item
    item = Product.find params[:item_id]
    @cart.add(item, item.price)
    new_item = @cart.shopping_cart_items.last
    new_item.name = item.name
    new_item.save
    redirect_to :back
  end

  def remove_cart_item
    ShoppingCartItem.find(params[:item_id]).destroy
    redirect_to action: :checkout
  end

  def checkout
  end
end
