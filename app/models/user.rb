class User < ApplicationRecord
  #### authentication ####
  has_secure_password
  #### associations ####
  has_one :wallet
  # has_many :orders, through: :listings, foreign_key: 'seller_id'


  # ==== as a seller:
  has_many :listings, foreign_key: 'seller_id'
  has_many :customer_orders, through: :listings, foreign_key: 'buyer_id', class_name: 'Order'
  # has_many :buyers, through: :customer_orders, foreign_key: 'buyer_id', :class_name =>"User"

  # ==== as a buyer:
  # has_many :sellers, through: :listings, foreign_key: 'seller_id'
  has_many :orders, foreign_key: 'buyer_id'
  has_many :reviews, through: :orders, foreign_key: 'buyer_id'

  #### validations ####
  validates :username, presence: true
  validates_uniqueness_of :username, :case_sensitive => false
  validates :username, format: { without: /\s/ }

  validates :email, presence: true
  validates :email, uniqueness: true
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :password, length: { minimum: 8 }

  def active_listings_count
    self.listings.select { |listing| listing.active }.count
  end

  def inactive_listings_count
    self.listings.select { |listing| !listing.active }.count
  end

  def sell_orders_count
    self.customer_orders.count
  end

  def buy_orders_count
    self.orders.count
  end

  # validates :password, length: {minimum: 8}
  # validate :has_uppercase_letters?
  # validate :has_digits?
  # validate :has_downcase_letters?
  #
  # def has_uppercase_letters?
  #  if !password.match(/[A-Z]/)
  #    errors.add(:password, "needs to have at least 1 upper-case letter")
  #  end
  # end
  #
  # def has_digits?
  #  if !password.match(/\d/)
  #    errors.add(:password, "needs to have at least 1 number")
  #  end
  # end
  #
  # def has_downcase_letters?
  #  if !password.match(/[a-z]{1}/)
  #    errors.add(:password, "needs to have at least 1 down-case letter")
  #  end
  # end

end
