class OrdersController < ApplicationController
	before_action :set_order, only: [:update, :edit, :show, :destroy]

	#Create
	def new

	end

	def create
		@order = Order.new(listing_id: order_params[:listing_id], quantity: order_params[:quantity], buyer_id: session[:user_id])
		if @order.save
			@order.transaction
			redirect_to order_path(@order)
		else
			@listing = Listing.find(@order.listing.id)
			render 'listings/show'
		end
	end
	#Read
	def index
		@orders = Order.all
	end

	def show
		# populated via :set_order
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
	def set_order
		@order = Order.find(params[:id])
	end

	def order_params
		params.require(:order).permit(:listing_id, :quantity)
	end
end
