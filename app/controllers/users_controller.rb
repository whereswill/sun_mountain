class UsersController < ApplicationController
  before_action :logged_in_user,          only: [:index, :edit, :update, :destroy,
                                                  :following, :followers]
  before_action :admin_or_correct_user,   only: [:edit, :update]
  before_action :admin_user,              only: [:new, :create, :destroy, :archive, :unarchive]

  def index
    if current_user.admin?
      if params[:group] == "inactive"
        @users = User.where.not(archived_at: [nil, ""]).order(:name).paginate(page: params[:page])
      else
        @users = User.where(archived_at: [nil, ""]).order(:name).paginate(page: params[:page])
      end
    else
      @users = User.where(activated: true, archived_at: [nil, ""]).order(:name).paginate(page: params[:page])
    end
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
    redirect_to root_url and return unless @user.activated == true
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:warning] = "User added but not activated! The new user must click on the activation link in their email."
      redirect_to users_url
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  def archive
    User.find(params[:id]).archive
    flash[:success] = "User archived"
    redirect_to users_url
  end

  def unarchive
    User.find(params[:id]).unarchive
    flash[:success] = "User unarchived"
    redirect_to users_url
  end

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end


  private

    # def user_params
    #   params.require(:user).permit(:name, :email, :password,
    #                                :password_confirmation)
    # end

    def user_params
      # List of common params
      list_params_allowed = [:name, :email, :password,
                                   :password_confirmation]
      # Add the params only for admin
      list_params_allowed << :admin if current_user.admin?
      params.require(:user).permit(list_params_allowed)
    end

    # Before filters

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

    def admin_or_correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user) || current_user.admin?
    end

end
