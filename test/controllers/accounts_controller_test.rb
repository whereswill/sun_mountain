require 'test_helper'

class AccountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @base_title = ENV["COMPANY_NAME"]
    @account = accounts(:one)
    @user = users(:michael)
    @other_user = users(:archer)
  end

  test "should get index" do
    log_in_as(@user)
    get accounts_url
    assert_response :success
  end

  test "should redirect index when not logged in" do
    get accounts_url
    assert_redirected_to login_url
  end

  test "should get new" do
    log_in_as(@user)
    get new_account_url
    assert_response :success
  end

  test "should create account" do
    log_in_as(@user)
    assert_difference('Account.count') do
      post accounts_url, params: { account: { account_number: "WW546",
                                              first_name: @account.first_name,
                                              last_name: @account.last_name,
                                              phone: @account.phone } }
    end

    assert_redirected_to account_url(Account.last)
  end

  test "should redirect create account when not logged in" do
    assert_no_difference 'Account.count' do
      post accounts_url, params: { account: { account_number: "WW789",
                                              first_name: @account.first_name,
                                              last_name: @account.last_name,
                                              phone: @account.phone } }
    end

    assert_redirected_to login_url
  end

  test "should show account" do
    log_in_as(@user)
    get account_url(@account)
    assert_response :success
  end

  test "should get edit" do
    log_in_as(@user)
    get edit_account_url(@account)
    assert_response :success
  end

  test "should redirect edit when not logged in" do
    get edit_account_url(@account)
    assert_redirected_to login_url
  end

  test "should update account" do
    log_in_as(@user)
    patch account_url(@account), params: { account: { account_number: "WW789",
                                          first_name: @account.first_name,
                                          last_name: @account.last_name,
                                          phone: @account.phone } }
    assert_redirected_to account_url(@account)
  end

  test "should redirect update account when not logged in" do
    patch account_url(@account), params: { account: { account_number: "WW789",
                                          first_name: @account.first_name,
                                          last_name: @account.last_name,
                                          phone: @account.phone } }
    assert_redirected_to login_url
  end

  test "should destroy account" do
    log_in_as(@user)
    assert_difference('Account.count', -1) do
      delete account_url(@account)
    end

    assert_redirected_to accounts_url
  end

  test "should not destroy account for non-admin" do
    log_in_as(@other_user)
    assert_no_difference 'Account.count' do
      delete account_url(@account)
    end

    assert_redirected_to root_url
  end
end
