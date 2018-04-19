class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :buyer_id
      t.integer :listing_id
      t.decimal :rating
      t.text :content

      t.timestamps
    end
  end
end
