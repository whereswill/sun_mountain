class InvoicesController < ApplicationController
  before_action :set_account,               only: [:index, :new, :edit, :create, :update, :destroy]
  before_action :set_invoice,               only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user,            only: [:new, :index, :create, :edit, :update, :destroy]

  # GET /invoices
  def index
    @invoices = @account.invoices
  end

  # GET /invoices/1
  def show
  end

  # GET /invoices/new
  def new
    @invoice = @account.invoices.build
  end

  # GET /invoices/1/edit
  def edit
    # would need to reformat this when it comes back to the update method
    # @invoice.invoice_date = input_date(@invoice.invoice_date)
  end

  # POST /invoices
  def create
    @invoice = @account.invoices.create(invoice_params)
    if @invoice.save
      flash[:success] = "Invoice was successfully created."
      redirect_to account_invoice_path(@account, @invoice)
    else
      render 'new'
    end
  end

  # PATCH/PUT /invoices/1
  def update
    if @invoice.update_attributes(invoice_params)
      flash[:success] = "Invoice was successfully updated."
      redirect_to account_invoice_path(@account, @invoice)
    else
      render 'edit'
    end
  end

  # DELETE /invoices/1
  def destroy
    @invoice.destroy
    flash[:success] = "Invoice was successfully destroyed."
    redirect_to account_path(@account)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:account_id]) # new, edit, create, update, destroy
    end

    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_params
      params.require(:invoice).permit(:status, :notes, :late_fee, :account_id, :invoice_date)
    end
end
