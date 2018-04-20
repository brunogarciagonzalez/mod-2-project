class ReviewsController < ApplicationController
	before_action :set_review, only: [:show, :edit, :update, :destroy]

	#-------------------Create--------------------------
	def new
		@order = Order.find(params[:order_id])
		@listing = @order.listing
		@review = Review.new()
	end

	def create
		#Need to figure out how to not make order_id
		#A hidden input
		@review = Review.new(review_params)
		if @review.valid?
			@review.save
			redirect_to user_path(@review.order.buyer_id)
		else
			@order = Order.find(review_params[:order_id])
			@listing = @order.listing
			render :new
		end
	end

	#-------------------Read----------------------------
	def index

	end

	def show
		@order = @review.order
		@listing = @order.listing
	end

	#-------------------Update--------------------------
	def edit
		@listing =@review.listing
		@order = @review.order
	end

	def update
		if @review.update(review_params)
			redirect_to review_path(@review)
		else
			@order = @review.order
			@listing = @order.listing
			render :edit
		end
	end

	#-------------------Destroy-------------------------
	def destroy
		@review.destroy
		redirect_to reviews_path
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
