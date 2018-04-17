class User < ApplicationRecord
  #### associations ####
  has_one :wallet
  has_many :listings, foreign_key: 'seller_id'
  has_many :orders, foreign_key: 'buyer_id'
  has_many :orders, through: :listings, foreign_key: 'seller_id'
  # ==== as a seller:
  has_many :buyers, through: :orders, foreign_key: 'buyer_id'
  # ==== as a buyer:
  has_many :sellers, through: :listings, foreign_key: 'seller_id'

  #### validations ####
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :password, length: {minimum: 8}
  validate :has_uppercase_letters?
  validate :has_digits?
  validate :has_downcase_letters?

  def has_uppercase_letters?
   if !password.match(/[A-Z]/)
     errors.add(:password, "needs to have at least 1 upper-case letter")
   end
  end

  def has_digits?
   if !password.match(/\d/)
     errors.add(:password, "needs to have at least 1 number")
   end
  end

  def has_downcase_letters?
   if !password.match(/[a-z]{1}/)
     errors.add(:password, "needs to have at least 1 down-case letter")
   end
  end

end
