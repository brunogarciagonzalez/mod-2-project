class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]

	#Create
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		@wallet = Wallet.new(Wallet.empty_wallet_hash)
		if @user.valid?
			@user.wallet = @wallet
			@wallet.save
			@user.save
			session[:user_id] = @user.id
			redirect_to user_path(@user)
		else
			render :new
		end
	end
	#Read
	def index
		@users = User.all
	end

	def show
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
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:username, :email,
									 :password, :password_confirmation)
	end

end
