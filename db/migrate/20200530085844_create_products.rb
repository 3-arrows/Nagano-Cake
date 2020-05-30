class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :genres_id
      t.string :name
      t.text :information
      t.integer :price
      t.string :image_id
      t.integer :sale_status

      t.timestamps
    end
  end
end
