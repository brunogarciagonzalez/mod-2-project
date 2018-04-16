class ListingsController < ApplicationController
	before_action :set_listing, only: [:show, :edit, :update, :destroy]
	#Create
	def new
		@listing = Listing.new
	end

	def create
		@listing = Listing.new(listing_params)
		if @listing.valid?
			@listing.save
			redirect_to listing_path(@listing)
		else
			render :new
		end
	end
	#Read
	def index
		@listings = Listing.all
	end

	def show
		
	end

	#Update

	def edit
		
	end

	def update
		
	end

	#Destroy
	def destroy
		
	end

	private
	def set_listing
		@listing = Listing.find(params[:id])
	end

	def listing_params
		params.require(:listing).permit(:title, :description, :price, :image_url, :seller)
	end


end
