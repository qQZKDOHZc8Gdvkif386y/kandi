class Order < ActiveRecord::Base
  has_many :order_products
  has_many :products, through: :order_products
end
