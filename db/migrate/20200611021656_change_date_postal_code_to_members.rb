class ChangeDatePostalCodeToMembers < ActiveRecord::Migration[5.2]
  def change
  	  change_column :members, :postal_code, :integer
  end
end
