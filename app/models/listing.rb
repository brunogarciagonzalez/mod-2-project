class Listing < ApplicationRecord
  belongs_to :seller, class_name: "User"
  has_many :orders
  
end
