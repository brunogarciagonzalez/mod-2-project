class Order < ApplicationRecord
  belongs_to :listing
  belongs_to :buyer, class_name: "User"
  # ====================================
  has_one :seller, through: :listing
end
