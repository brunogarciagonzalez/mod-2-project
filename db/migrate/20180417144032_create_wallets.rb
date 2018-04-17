class CreateWallets < ActiveRecord::Migration[5.1]
  def change
    create_table :wallets do |t|
      t.decimal :usd_balance
      t.string :btc_address
      t.float :btc_balance
      t.string :eth_address
      t.float :eth_balance
      t.string :ltc_address
      t.float :ltc_balance
      t.integer :user_id

      t.timestamps
    end
  end
end
