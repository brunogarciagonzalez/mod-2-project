class AddColumnStockQuantityToListings < ActiveRecord::Migration[5.1]
  def change
    add_column :listings, :stock_quantity, :integer
  end
end
