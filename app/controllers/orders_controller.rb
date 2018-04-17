class OrdersController < ApplicationController
	before_action :set_order, only: [:update, :edit, :show, :destroy]

	#Create
	def new

	end

	def create

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


end
