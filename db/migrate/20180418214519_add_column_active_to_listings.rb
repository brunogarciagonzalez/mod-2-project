class AddColumnActiveToListings < ActiveRecord::Migration[5.1]
  def change
    add_column :listings, :active, :boolean, :default => true
  end
end
