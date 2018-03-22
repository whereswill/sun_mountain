require 'test_helper'

class InvoicesEditTest < ActionDispatch::IntegrationTest

  def setup
    @account = accounts(:one)
    @invoice = invoices(:one)
    @user    = users(:archer)
  end

  test "only logged in user can edit invoice" do
    get edit_account_invoice_path(@account, @invoice)
    assert_redirected_to login_url
  end

  test "unsuccessful edit with invalid info" do
    log_in_as @user
    get edit_account_invoice_path(@account, @invoice)
    assert_template 'invoices/edit'
    patch account_invoice_path(id: @invoice.id,
                              account_id: @account.id,
                               invoice: { status: "sent",
                                          late_fee: "bad data",
                                          notes: ""})
    assert_template 'invoices/edit'
  end

  test "successful edit with valid info" do
    log_in_as @user
    get edit_account_invoice_path(@account, @invoice)
    assert_template 'invoices/edit'
    status = "sent"
    late_fee = 5.00
    patch account_invoice_path(id: @invoice.id,
                              account_id: @account.id,
                               invoice: { status: status,
                                          late_fee: late_fee,
                                          notes: ""})
    assert_not flash.empty?
    assert_redirected_to account_invoice_url(@account, @invoice)
    @invoice.reload
    assert_equal status,  @invoice.status
    assert_equal late_fee, @invoice.late_fee
  end
end
