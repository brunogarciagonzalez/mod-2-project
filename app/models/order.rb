class Order < ApplicationRecord
  #### associations ####
  belongs_to :listing
  belongs_to :buyer, class_name: "User"
  # ====================================
  has_one :seller, through: :listing
  #### validations ####
  validate :quantity_error_check
  validate :wallet_error_check

  def total_price
    self.quantity * self.listing.price
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

  # currenlty specific to usd, need to add abstraction so can use methods for crypto validations

  def wallet_error_check
    if !valid_wallet_amount?
      errors.add(:base, "insufficient #{currency} funds")
    end
  end

  def valid_wallet_amount?
    if (self.buyer.wallet.usd_balance >= self.total_price)
      true
    else
      false
    end
  end

end
