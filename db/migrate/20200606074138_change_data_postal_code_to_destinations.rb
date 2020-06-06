class ChangeDataPostalCodeToDestinations < ActiveRecord::Migration[5.2]
  def change
  	change_column :destinations, :postal_code, :string
  end
end
