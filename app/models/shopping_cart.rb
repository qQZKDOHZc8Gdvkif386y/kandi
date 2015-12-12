class ShoppingCart < ActiveRecord::Base
  belongs_to :user
  has_many :shopping_cart_items
  acts_as_shopping_cart
end
