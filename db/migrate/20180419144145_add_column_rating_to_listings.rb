class AddColumnRatingToListings < ActiveRecord::Migration[5.1]
  def change
    add_column :listings, :rating, :decimal
  end
end
