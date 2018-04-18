class Wallet < ApplicationRecord
  belongs_to :user

  def self.default_wallet_hash
  	wallet_hash = {	
		usd_balance: 100000.00,
	    btc_address: Faker::Crypto.sha256,
	    btc_balance: 10.0,
	    eth_address: Faker::Crypto.sha256,
	    eth_balance: 20.0,
	    ltc_address: Faker::Crypto.sha256,
	    ltc_balance: 70.0
  	}
  end


  def self.empty_wallet_hash
  	wallet_hash = {
  		usd_balance: 100000.00,
	    btc_address: "",
	    btc_balance: 0.0,
	    eth_address: "",
	    eth_balance: 0.0,
	    ltc_address: "",
	    ltc_balance: 0.0
  	}
  	
  end
end
