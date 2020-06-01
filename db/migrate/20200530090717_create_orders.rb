class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :member_id
      t.integer :pay
      t.integer :postage
      t.integer :total_price
      t.integer :postal_code
      t.string :prefecture_code
      t.string :city
      t.string :street
      t.string :name
      t.integer :status

      t.timestamps
    end
  end
end
