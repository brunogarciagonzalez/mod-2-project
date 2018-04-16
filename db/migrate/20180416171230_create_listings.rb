class CreateListings < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|
      t.integer :seller_id
      t.string :title
      t.text :description
      t.decimal :price
      t.text :image_url

      t.timestamps
    end
  end
end
