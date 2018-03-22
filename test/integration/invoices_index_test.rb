require 'test_helper'

class InvoicesIndexTest < ActionDispatch::IntegrationTest

  def setup
    @account = accounts(:one)
    @invoice = invoices(:one)
    @user    = users(:archer)
  end

  test "accounts as logged in user including pagination and delete links" do
    log_in_as(@user)
    get account_invoices_path(@account)
    assert_template 'invoices/index'
    assert_select 'table#invoices'
    first_page_of_invoices = @account.invoices
    first_page_of_invoices.each do |invoice|
      assert_select 'a[href=?]', account_invoice_path(@account, invoice), text: 'Show'
      unless invoice.status == ''

      end
      unless  invoice.status == 'paid'
        assert_select 'a[href=?]', edit_account_invoice_path(invoice.account, invoice)
        assert_select 'a[href=?]', account_invoice_path(@account, invoice), text: 'Destroy'
      end
      #assert_select "i.glyphicon-trash"
    end
    assert_difference 'Invoice.count', -1 do
      delete account_invoice_path(@account, @invoice)
    end
  end
end
