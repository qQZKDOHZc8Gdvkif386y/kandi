class AddSpicyLevelToProducts < ActiveRecord::Migration
  def change
    add_column :products, :spicy_level, :integer
  end
end
