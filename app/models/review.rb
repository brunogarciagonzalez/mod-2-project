class Review < ApplicationRecord
	#------------Associations -------------#
	belongs_to :order 
	has_one :listing, through: :order
	has_one :buyer, through: :order

	def star_image
		flag = self.rating.to_i
		case flag
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
			'★'
		end
	end


end
