class AddressesController < ApplicationController
  before_action :set_account,             only: [:new, :edit, :create, :update, :destroy]
  before_action :set_address,              only: [:edit, :update]

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
    @address = @account.addresses.find(params[:id])
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

end
