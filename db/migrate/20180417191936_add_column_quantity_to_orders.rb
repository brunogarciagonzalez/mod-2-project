class AddColumnQuantityToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :quantity, :integer, :default => 1
  end
end