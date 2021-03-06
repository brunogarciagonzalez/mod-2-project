class Listing < ApplicationRecord
  belongs_to :seller, class_name: "User"
  has_many :orders
  has_many :customer_orders, class_name: 'Order'


  has_many :reviews, through: :orders


  #### validations ####
  validates :seller_id, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :image_url, presence: true
  validates :stock_quantity, presence: true
  validates :stock_quantity, numericality: { greater_than_or_equal_to: 0 }
  # validates_numericality_of :stock_quantity

  def seller=(seller_id_str)
  	self.seller_id = seller_id_str.to_i
  end

  def toggle_active
    if self.active
      self.active = false
    else
      self.active = true
    end
  end
  
  def listing_review_stars
    flag = average_rating
    case flag.to_i
    when 1
      '★'
    when 2
      '★★'
    when 3
      '★★★'
    when 4
      '★★★★'
    when 5
      '★★★★★'
    else
      'No Reviews Yet!'
    end
  end

  def average_rating
    if !self.reviews.empty?
      reviews_arr = self.reviews.map{|r| r.rating}
      reviews_arr.inject{ |sum, el| sum + el }.to_f / reviews_arr.size
    else 
      'N/A'
    end
  end

end
