class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :listing_id
      t.integer :buyer_id

      t.timestamps
    end
  end
end
