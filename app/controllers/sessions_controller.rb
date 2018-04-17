class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def signin
   @user = User.find_by(username: params[:username]).try(:authenticate, params[:password])
      # binding.pry
     if @user
       session[:user_id] = @user.id
       redirect_to user_path(@user)
     end
  end



end
