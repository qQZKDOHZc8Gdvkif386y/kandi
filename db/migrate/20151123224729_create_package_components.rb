class CreatePackageComponents < ActiveRecord::Migration
  def change
    create_table :package_components do |t|
      t.integer :package_id
      t.integer :component_id

      t.timestamps null: false
    end
  end
end
