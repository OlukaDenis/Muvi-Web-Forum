class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase) 
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        remember user
        # redirect_to user
        redirect_back_or user
      else
        message = "Account not activated. "
        message += "Please, check your email for the activation link!"
        flash[:warning] = message
        redirect_to root_url
      end
     
    else
      flash.now[:danger] = 'Incorrect email or password'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    flash.now[:warning] = 'You have been logged out!'
    redirect_to root_url
  end
end
