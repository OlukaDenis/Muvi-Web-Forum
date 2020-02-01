class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase) 
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      remember user
      # redirect_to user
      redirect_back_or user
    else
      flash.now[:danger] = 'Incorrect email/password'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    flash.now[:warning] = 'You have been logged out!'
    redirect_to root_url
  end
end
