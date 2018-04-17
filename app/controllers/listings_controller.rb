class ListingsController < ApplicationController
	before_action :set_listing, only: [:show, :edit, :update, :destroy]
	#Create
	def new

	end

	def create

	end
	#Read
	def index
		@listings = Listing.all
	end

	def show
		# populated via :set_listing
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


end
