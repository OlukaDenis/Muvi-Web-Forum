class UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users

  end

  def show
    @user = User.find(params[:id])
    render json: @user

    # debugger
  end

  def new
     @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Muvi Forum, #{@user.name}"
      redirect_to @user
    else
      flash[:danger] = "Error occured, please try again!"
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
