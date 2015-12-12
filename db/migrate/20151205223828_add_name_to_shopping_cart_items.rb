class AddNameToShoppingCartItems < ActiveRecord::Migration
  def change
    add_column :shopping_cart_items, :name, :string
  end
end
