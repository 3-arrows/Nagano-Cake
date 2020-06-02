class AddSubTotalToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :sub_total, :integer
  end
end
