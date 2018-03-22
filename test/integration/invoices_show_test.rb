require 'test_helper'

class InvoicesShowTest < ActionDispatch::IntegrationTest

  def setup
    @account = accounts(:one)
    @invoice = invoices(:one)
    @user    = users(:archer)
  end

  test "invoices as logged-in user" do
    log_in_as(@user)
    get account_invoice_path(@account, @invoice)
    assert_template 'invoices/show'
    assert_select 'a[href=?]', edit_account_invoice_path(@account, @invoice)
    assert_select 'a[href=?]', account_path(@account)
    assert_select 'h1', "Invoice: #{@invoice.created_at}"
  end
end
