class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  def index
    # @users = User.all
    @users = User.paginate(page: params[:page])
    # render json: @users
  end

  def show
    @user = User.find(params[:id])
    @questions = @user.questions.paginate(page: params[:page])
    @feed_items = current_user.feed.paginate(page: params[:page]) if current_user
    
    # render json: @user
    # debugger
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # log_in @user
      UserMailer.account_activation(@user).deliver_now
      # @user.send_activation_email
      flash[:info] = "Please check your email to activate your account"
      # redirect_to @user
      redirect_to root_url
    else
      flash[:danger] = "Error occured, please try again!"
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:success] = "User has been deleted successfully"
      redirect_to users_path
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

end
