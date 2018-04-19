class Order < ApplicationRecord
  #### associations ####
  belongs_to :listing
  belongs_to :buyer, class_name: "User"
  # ====================================
  has_one :seller, through: :listing
  #### validations ####
  validate :quantity_error_check
  validate :wallet_error_check

  def transaction
    #update listing stock_quantity based on order quantity
    self.listing.stock_quantity -= self.quantity
    self.listing.save
    #access buyer wallet balance for specific currency
    self.access_buyer_wallet_of_order_currency -= self.total_price
    self.buyer.wallet.save

    #access seller wallet balance for specific currency
    self.access_seller_wallet_of_order_currency += self.total_price
    self.seller.wallet.save
  end

  def total_price
    # should not be private method, it is also used in order#show view
    self.quantity * self.listing.price
  end

  def access_buyer_wallet_of_order_currency
    order_currency = order_currency_from_listing

    case order_currency
    when "USD"
      self.buyer.wallet.usd_balance.to_f
    when "BTC"
      self.buyer.wallet.btc_balance
    when "ETH"
      self.buyer.wallet.eth_balance
    when "LTC"
      self.buyer.wallet.ltc_balance
    end

  end

  def access_buyer_wallet_of_order_currency=(num)
    order_currency = order_currency_from_listing

    case order_currency
    when "USD"
      self.buyer.wallet.usd_balance = num
    when "BTC"
      self.buyer.wallet.btc_balance = num
    when "ETH"
      self.buyer.wallet.eth_balance = num
    when "LTC"
      self.buyer.wallet.ltc_balance = num
    end
  end

  def access_seller_wallet_of_order_currency
    order_currency = order_currency_from_listing

    case order_currency
    when "USD"
      self.seller.wallet.usd_balance
    when "BTC"
      self.seller.wallet.btc_balance
    when "ETH"
      self.seller.wallet.eth_balance
    when "LTC"
      self.seller.wallet.ltc_balance
    end
  end

  def access_seller_wallet_of_order_currency=(num)
    order_currency = order_currency_from_listing

    case order_currency
    when "USD"
      self.seller.wallet.usd_balance = num
    when "BTC"
      self.seller.wallet.btc_balance = num
    when "ETH"
      self.seller.wallet.eth_balance = num
    when "LTC"
      self.seller.wallet.ltc_balance = num
    end
  end

  private
  def quantity_error_check
    if !valid_order_quantity?
      errors.add(:quantity, "unavailable; #{self.listing.stock_quantity} in stock")
    end
  end

  def valid_order_quantity?
    if (self.quantity <= self.listing.stock_quantity) && (self.quantity > 0)
      true
    else
      false
    end
  end

  def wallet_error_check
    if !valid_wallet_amount?
      errors.add(:base, "insufficient #{self.listing.currency} funds in your wallet")
    end
  end

  def valid_wallet_amount?
    # set a variable equal to currency used
    buyer_currency_balance = access_buyer_wallet_of_order_currency
    # check the balance against order total price
    if (buyer_currency_balance >= self.total_price)
      true
    else
      false
    end
  end

  def order_currency_from_listing
    self.listing.currency
  end


end
