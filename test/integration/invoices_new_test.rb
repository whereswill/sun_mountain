require 'test_helper'

class InvoicesNewTest < ActionDispatch::IntegrationTest

  def setup
    @account = accounts(:one)
    @invoice = invoices(:one)
    @user    = users(:archer)
  end

  test "only logged in user can add invoice" do
    get new_account_invoice_path(@account, @invoice)
    assert_redirected_to login_url
  end

  test "invalid invoice information" do
    log_in_as(@user)
    get new_account_invoice_path(@account)
    assert_no_difference 'Address.count' do
      post account_invoices_path(id: @invoice.id,
                              account_id: @account.id,
                               invoice: { status: "sent",
                                          late_fee: "bad data",
                                          notes: ""})
    end
    assert_template 'invoices/new'
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
  end

  test "valid invoice information successful" do
    log_in_as(@user)
    get new_account_invoice_path(@account)
    assert_difference 'Invoice.count', 1 do
      post account_invoices_path(id: @account.id,
                              account_id: @account.id,
                               invoice: { status: "paid",
                                          late_fee: 5.00,
                                          notes: ""})
    end
    assert_not flash.empty?
    assert_redirected_to account_invoice_url(@account, @account.invoices.last)
  end
end
