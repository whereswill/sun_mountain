class AddressesController < ApplicationController
  before_action :set_account,               only: [:new, :edit, :create, :update, :destroy]
  before_action :set_address,               only: [:edit, :update, :destroy]
  before_action :logged_in_user,            only: [:new, :create, :edit, :update, :destroy]
  before_action :preserve_delivery_address, only: [:destroy]

  def new
    @address = @account.addresses.build
  end

  def edit
  end

  def create
    @address = @account.addresses.create(address_params)
    if @address.save
      flash[:success] = "Address was successfully created."
      redirect_to account_path(@account)
    else
      render 'new'
    end
  end

  def update
    if @address.update_attributes(address_params)
      flash[:success] = "Address was successfully updated."
      redirect_to account_path(@account)
    else
      render 'edit'
    end
  end

  def destroy
    @address.destroy
    flash[:success] = "Address was successfully destroyed."
    redirect_to account_path(@account)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:account_id]) # new, edit, create, update, destroy
    end

    def set_address
      @address = @account.addresses.find(params[:id]) # edit, update
    end

    def address_params
      params.require(:address).permit!
    end

    # Won't allow deletion of the Delivery address as it could leave an account
    # without an address
    def preserve_delivery_address
      if @address.address_type == 1
        flash[:danger] = "Delivery Address cannot be deleted from account."
        redirect_to account_path(@address.account)
      end
    end

end
