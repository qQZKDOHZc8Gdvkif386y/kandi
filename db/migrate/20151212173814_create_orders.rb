class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.string :email
      t.string :status

      t.timestamps null: false
    end
  end
end
