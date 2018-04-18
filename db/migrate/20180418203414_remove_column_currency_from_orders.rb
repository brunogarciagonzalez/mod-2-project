class RemoveColumnCurrencyFromOrders < ActiveRecord::Migration[5.1]
  def change
  	remove_column :orders, :currency
  end
end
