class AccountsController < ApplicationController
  before_action :set_account,             only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user,          only: [:index, :create, :edit, :update, :destroy]
  before_action :admin_user,              only: [:destroy]

  # GET /accounts
  # GET /accounts.json
  def index
    @accounts = Account.all
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
  end

  # GET /accounts/new
  def new
    @account = Account.new
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @account = Account.new(account_params)

    if @account.save
      flash[:success] = "Account was successfully created."
      redirect_to @account
    else
      render 'new'
    end
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    if @account.update(account_params)
      flash[:success] = "Account was successfully updated."
      redirect_to @account
    else
      render 'edit'
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account.destroy
    flash[:success] = "Account was successfully destroyed."
    redirect_to accounts_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:account).permit(:account_number, :first_name, :last_name, :phone, :email, :notes)
    end
end
