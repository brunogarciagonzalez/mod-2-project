class ReviewsController < ApplicationController
	before_action :set_review, only: [:show, :edit, :update, :destroy]

	#-------------------Create--------------------------
	def new
		
	end

	def create
		
	end

	#-------------------Read----------------------------
	def index
		
	end

	def show
		
	end

	#-------------------Update--------------------------
	def edit
		
	end

	def update
		
	end

	#-------------------Destroy-------------------------
	def destroy
		
	end


	private
	def set_review
		@review = Review.find(params[:id])
	end

	def review_params
		params.require(:review).permit(:order_id, :content,
									   :rating)
	end

end
