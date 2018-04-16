class User < ApplicationRecord
  has_many :listings, foreign_key: 'seller_id'
  has_many :orders, foreign_key: 'buyer_id'
  has_many :orders, through: :listings, foreign_key: 'seller_id'
  # ==== as a seller:
  has_many :buyers, through: :orders, foreign_key: 'buyer_id'
  # ==== as a buyer:
  has_many :sellers, through: :listings, foreign_key: 'seller_id'

end
