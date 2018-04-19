class RemoveColumnBuyerIdFromReviews < ActiveRecord::Migration[5.1]
  def change
  	remove_column :reviews, :buyer_id
  end
end
