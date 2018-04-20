class WalletsController < ApplicationController

  def edit
    # how to find the wallet?
    @user = User.find(params[:id])
    @wallet = @user.wallet
    #make sure the following two are actually possible, else don't go thru
    @operation = params[:operation] # deposit or withdraw
    @currency = params[:currency]
  end

  def update
    @user = current_user
    @wallet = current_user.wallet
    @operation = wallet_params[:operation]
    @currency = wallet_params[:currency]

    if @operation == "withdraw"
      case @currency
      when "USD"
        @amount = wallet_params[:usd_balance]
        @wallet.withdrawal_validations(@currency, @amount)

      when "BTC"
        @amount = wallet_params[:btc_balance]
        @wallet.withdrawal_validations(@currency, wallet_params[:btc_balance])
      when "ETH"
        @amount = wallet_params[:eth_balance]
        @wallet.withdrawal_validations(@currency, wallet_params[:eth_balance])
      when "LTC"
        @amount = wallet_params[:ltc_balance]
        @wallet.withdrawal_validations(@currency, wallet_params[:ltc_balance])
      end

      if !@wallet.errors.any?
        @wallet.withdraw_funds(@currency, @amount)
        @wallet.save
        redirect_to user_path(@user)
      else
        render 'users/show'
      end
    elsif @operation == "deposit"
      case @currency
      when "USD"
        @amount = wallet_params[:usd_balance]
      when "BTC"
        @amount = wallet_params[:btc_balance]
      when "ETH"
        @amount = wallet_params[:eth_balance]
      when "LTC"
        @amount = wallet_params[:ltc_balance]
      end

      @wallet.deposit_funds(@currency, @amount)
      @wallet.save

      redirect_to user_path(@user)
    end
  end

  def showuser
    @user = Wallet.find(params[:id]).user
    redirect_to user_path(@user)
  end

  private
  def wallet_params
    params.require(:wallet).permit(:id, :currency, :operation, :usd_balance, :btc_address, :btc_balance, :eth_address, :eth_balance, :ltc_address, :ltc_balance)
  end
end
