class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]

	#Create
	def new

	end

	def create

	end
	#Read
	def index
		@users = User.all
	end

	def show
		byebug
		#populated via :set_user
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
	def set_user
		@user = User.find(session[:user_id])
	end

end
