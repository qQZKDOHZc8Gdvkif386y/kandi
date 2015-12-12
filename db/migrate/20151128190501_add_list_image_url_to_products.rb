class AddListImageUrlToProducts < ActiveRecord::Migration
  def change
    add_column :products, :list_image_url, :string
  end
end
