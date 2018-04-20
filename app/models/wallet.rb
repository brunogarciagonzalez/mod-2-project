class Wallet < ApplicationRecord
  #### associations ####
  belongs_to :user

  #### validations ####
  #   validates balances, numericality: { greater_than: 0 }
  #   validates balances, presence: true


  def withdraw_funds(currency, num) #id is implicit, operation is implicit
    #wallet_params: {"id"=>"2", "operation"=>"withdraw", "btc_balance"=>"1"}
    case currency
    when "USD"
      self.usd_balance -= num.to_f
    when "BTC"
      self.btc_balance -= num.to_f
    when "ETH"
      self.eth_balance -= num.to_f
    when "LTC"
      self.ltc_balance -= num.to_f
    end

  end

  def deposit_funds(currency, num)
    case currency
    when "USD"
      self.usd_balance += num.to_f
    when "BTC"
      self.btc_balance += num.to_f
    when "ETH"
      self.eth_balance += num.to_f
    when "LTC"
      self.ltc_balance += num.to_f
    end
  end

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

  def withdrawal_validations(currency, withdraw_num)
    fund_withdrawal_check(currency, withdraw_num)
  end

  def fund_withdrawal_check(currency, withdraw_num)
    case currency
    when "USD"
      if withdraw_num.to_f > self.usd_balance.to_f
        errors.add(:base, "Not enough #{currency} funds to withdraw this amount")
      end
    when "BTC"
      if withdraw_num.to_f > self.btc_balance.to_f
        errors.add(:base, "Not enough #{currency} funds to withdraw this amount")
      end
    when "ETH"
      if withdraw_num.to_f > self.eth_balance.to_f
        errors.add(:base, "Not enough #{currency} funds to withdraw this amount")
      end
    when "LTC"
      if withdraw_num.to_f > self.ltc_balance.to_f
        errors.add(:base, "Not enough #{currency} funds to withdraw this amount")
      end
    end
  end

end
