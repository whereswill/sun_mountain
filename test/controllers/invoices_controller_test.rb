require 'test_helper'

class InvoicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @account = accounts(:one)
    @invoice = invoices(:one)
    @user = users(:michael)
  end

  test "should get index" do
    # get account_invoices_url(id: @account.id)
    # get account_invoices_url(account_id: @account.id)
    get account_invoices_url(@account)
    assert_response :success
  end

  test "should get new" do
    # get new_account_invoice_url
    # assert_response :success
    log_in_as(@user)
    get new_account_invoice_url(account_id: @account.id)
    assert_response :success
  end

  test "should create invoice" do
    assert_difference('Invoice.count') do
      post account_invoices_url(account_id: @account.id,
                                 invoice: { status: @invoice.status,
                                          late_fee: @invoice.late_fee,
                                          notes: @invoice.notes })
    end

    assert_redirected_to account_invoice_url(@account, Invoice.last)
  end

  test "should show invoice" do
    get account_invoice_url(@account, @invoice)
    assert_response :success
  end

  test "should get edit" do
    get edit_account_invoice_url(account_id: @account.id, id: @invoice.id)
    assert_response :success
  end

  test "should update invoice" do
    patch account_invoice_url(id: @invoice.id,
                              account_id: @account.id,
                               invoice: { status: "sent",
                                          late_fee: 10.00,
                                          notes: @invoice.notes })

    assert_redirected_to account_invoice_url(@account, @invoice)
  end

  test "should destroy invoice" do
    assert_difference('Invoice.count', -1) do
      delete account_invoice_url(id: @invoice.id,
                                account_id: @account.id)
    end

    assert_redirected_to account_url
  end
end
