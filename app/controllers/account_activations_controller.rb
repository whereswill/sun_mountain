class AccountActivationsController < ApplicationController
  before_action :admin_user,     only: [:update]

  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      log_in user
      flash[:success] = "Account activated!"
      redirect_to user
    else
      flash[:danger] = "Invalid activation link"
      redirect_to root_url
    end
  end

  def update
    user = User.find_by(id: params[:id])
    if user && !user.activated?
      create_reactivation_digest(user)
    end
    if user.save
      user.send_activation_email
      flash[:warning] = "Activation email has been resent! The new user must click on the activation link in their email."
    else
      flash[:warning] = "There was a problem re-sending the reactivation email."
    end
    redirect_back_or users_url
  end

  private

    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

    # Creates and assigns the activation token and digest.
    def create_reactivation_digest(user)
      user.activation_token  = User.new_token
      user.activation_digest = User.digest(user.activation_token)
    end
end
