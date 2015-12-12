class AddListImageToProducts < ActiveRecord::Migration
  def change
    add_column :products, :list_image, :integer
  end
end
