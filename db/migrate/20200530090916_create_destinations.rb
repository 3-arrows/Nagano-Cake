class CreateDestinations < ActiveRecord::Migration[5.2]
  def change
    create_table :destinations do |t|
      t.integer :member_id
      t.integer :postal_code
      t.string :prefecture_code
      t.string :city
      t.string :street
      t.string :name

      t.timestamps
    end
  end
end
