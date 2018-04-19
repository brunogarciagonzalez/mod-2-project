class AddColumnOrderIdToReviews < ActiveRecord::Migration[5.1]
  def change
  	add_column :reviews, :order_id, :integer
  end
end
