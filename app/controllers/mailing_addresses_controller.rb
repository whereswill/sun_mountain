class MailingAddressesController < ApplicationController

  def new
    @account = Account.find(params[:account_id])
    @mailing_address = @account.build_mailing_address
  end

  def create
    @account = Account.find(params[:account_id])
    @mailing_address = @account.create_mailing_address(params[:mailing_address])
    redirect_to @account
  end

end
