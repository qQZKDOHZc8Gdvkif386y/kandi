class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_cart
  before_action :set_store_filters
  before_action :set_current_user

  private

  def set_cart
    if current_user
      if current_user.cart
        @cart = current_user.cart
      else
        @cart = current_user.cart.create
      end
    else
      if session[:cart_id]
        @cart = ShoppingCart.find session[:cart_id]
      else
        @cart = ShoppingCart.create
        session[:cart_id] = @cart.id
      end
    end
  end

  def set_current_user
    @current_user = current_user
  end

  def set_store_filters
    @category_id = params[:category_id] && (session[:category_id] = (params[:category_id] == 'clear' ? nil : params[:category_id])) || session[:category_id]
    @spicy_level = params[:spicy_level] && (session[:spicy_level] = (params[:spicy_level] == 'clear' ? nil : params[:spicy_level].to_i)) || session[:spicy_level]
    @page        = params[:page] && (session[:page] = params[:page]) || session[:page]
    @per_page    = params[:per_page] && (session[:per_page] = params[:per_page]) || session[:per_page]
  end
end