class UsersController < ApplicationController
   before_action :signed_in_user, only: [:edit, :update, :show, :destroy,:index,:updateMail]
   before_action :correct_user,   only: [:edit, :update, :show]
   before_action :admin_user,     only: [:destroy,:index,:updateMail]

  def new
  	@user = User.new
  end

  def show
  	@user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)   
    if @user.save
      sign_in @user
      flash[:success] = "welcome to wherami! Apply openSDK for your App"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile Updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def index
    @users = User.paginate(page: params[:page],:per_page => 20)
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User Deleted."
    redirect_to users_url
  end





  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end



    def correct_user
      if !current_user.admin?
        @user = User.find(params[:id])
        redirect_to(current_user) unless current_user?(@user)
      end
      
    end

    def admin_user
      redirect_to(current_user) unless current_user.admin?
    end

end
