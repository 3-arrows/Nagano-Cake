class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.integer :product_id
      t.integer :member_id
      t.integer :count

      t.timestamps
    end
  end
end
