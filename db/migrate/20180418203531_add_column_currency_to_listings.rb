class AddColumnCurrencyToListings < ActiveRecord::Migration[5.1]
  def change
    add_column :listings, :currency, :string
  end
end
