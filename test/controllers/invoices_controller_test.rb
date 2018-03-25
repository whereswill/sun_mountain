require 'test_helper'

class InvoicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @account = accounts(:one)
    @invoice = invoices(:one)
    @user = users(:michael)
  end

  test "should redirect index when not logged in" do
    get account_invoices_url(@account)
    assert_redirected_to login_url
  end

  test "should get index" do
    log_in_as(@user)
    get account_invoices_url(@account)
    assert_response :success
  end

  test "should redirect new when not logged in" do
    get account_invoices_url(@account)
    assert_redirected_to login_url
  end

  test "should get new" do
    log_in_as(@user)
    get new_account_invoice_url(account_id: @account.id)
    assert_response :success
  end

  test "should redirect create when not logged in" do
    post account_invoices_url(account_id: @account.id,
                                 invoice: { status: @invoice.status,
                                          late_fee: @invoice.late_fee,
                                          notes: @invoice.notes })
    assert_redirected_to login_url
  end

  test "should create invoice" do
    log_in_as(@user)
    assert_difference('Invoice.count') do
      post account_invoices_url(account_id: @account.id,
                                 invoice: { status: @invoice.status,
                                          late_fee: @invoice.late_fee,
                                          invoice_date: Date.today,
                                          notes: @invoice.notes })
    end

    assert_redirected_to account_invoice_url(@account, Invoice.last)
  end

  test "should show invoice" do
    log_in_as(@user)
    get account_invoice_url(@account, @invoice)
    assert_response :success
  end

  test "should redirect edit when not logged in" do
    get edit_account_invoice_url(account_id: @account.id, id: @invoice.id)
    assert_redirected_to login_url
  end

  test "should get edit" do
    log_in_as(@user)
    get edit_account_invoice_url(account_id: @account.id, id: @invoice.id)
    assert_response :success
  end

  test "should redirect update when not logged in" do
    patch account_invoice_url(id: @invoice.id,
                              account_id: @account.id,
                               invoice: { status: "sent",
                                          late_fee: 10.00,
                                          notes: @invoice.notes })
    assert_redirected_to login_url
  end

  test "should update invoice" do
    log_in_as(@user)
    patch account_invoice_url(id: @invoice.id,
                              account_id: @account.id,
                               invoice: { status: "sent",
                                          late_fee: 10.00,
                                          notes: @invoice.notes })

    assert_redirected_to account_invoice_url(@account, @invoice)
  end

  test "should redirect destroy when not logged in" do
    delete account_invoice_url(id: @invoice.id,
                                account_id: @account.id)
    assert_redirected_to login_url
  end

  test "should destroy invoice" do
    log_in_as(@user)
    assert_difference('Invoice.count', -1) do
      delete account_invoice_url(id: @invoice.id,
                                account_id: @account.id)
    end

    assert_redirected_to account_url
  end
end
