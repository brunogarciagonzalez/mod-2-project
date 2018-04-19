class RemoveColumnListingIdFromReviews < ActiveRecord::Migration[5.1]
  def change
  	remove_column :reviews, :listing_id
  end
end
