class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :member_id
      t.string :pay
      t.integer :postage
      t.integer :total_price
      t.string :post_number
      t.string :address
      t.string :name
      t.integer :status

      t.timestamps
    end
  end
end
