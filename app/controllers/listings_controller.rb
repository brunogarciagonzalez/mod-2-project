class ListingsController < ApplicationController
	before_action :set_listing, only: [:show, :edit, :update, :destroy]
	#Create
	def new
		@listing = Listing.new
		@currency = ["BTC", "LTC", "ETH", "USD"]
	end

	def create
		@listing = Listing.new(listing_params)
		if @listing.valid?
			@listing.save
			redirect_to listing_path(@listing)
		else
			@currency = ["BTC", "LTC", "ETH", "USD"]
			render :new
		end
	end
	#Read
	def index
		@listings = Listing.all
	end

	def show
		# populated via :set_listing
		@order = Order.new
	end

	#Update

	def edit
		# populated via :set_listing
		@currency = ["BTC", "LTC", "ETH", "USD"]
	end

	def update
		@listing = Listing.find(params[:id])
		# need to update
		if @listing.update(listing_params)
			redirect_to listing_path(@listing)
		else
			@currency = ["BTC", "LTC", "ETH", "USD"]
			render :edit
		end
	end

	#Destroy ==> used as active toggle
	def destroy
		listing = Listing.find(params[:id])
		listing.toggle_active
		listing.save

		redirect_to user_path(current_user)
	end

	private
	def set_listing
		@listing = Listing.find(params[:id])
	end

	def listing_params
		params.require(:listing).permit(:title, :description,
										:price, :image_url,
									    :seller, :stock_quantity,
									    :currency)
	end


end
