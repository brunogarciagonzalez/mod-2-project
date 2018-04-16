class Listing < ApplicationRecord
  belongs_to :seller, class_name: "User"
  has_many :orders
  #### validations ####
  validates :seller_id, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :image_url, presence: true
end
