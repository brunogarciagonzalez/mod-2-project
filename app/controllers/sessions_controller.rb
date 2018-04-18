class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def signin
   @user = User.find_by(username: params[:username]).try(:authenticate, params[:password])
     if @user
       session[:user_id] = @user.id
       redirect_to user_path(@user)
     else
      @user = User.new()
      @user.errors.add(:username, "Incorrect Username or Password")
      render :new
     end
  end

  def signout
    session[:user_id] = nil
    redirect_to '/'
  end


end
