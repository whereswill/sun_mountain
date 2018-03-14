require 'test_helper'

class AddressesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @base_title = ENV["COMPANY_NAME"]
    @account = accounts(:one)
    @address = addresses(:one)
    @mail_account = accounts(:two)
    @mail_address = addresses(:three)
    @user = users(:michael)
  end

  test "should get new" do
    log_in_as(@user)
    get new_account_address_url(account_id: @account.id)
    assert_response :success
  end

  test "should redirect new when not logged in" do
    get new_account_address_url(account_id: @account.id)
    assert_redirected_to login_url
  end

  test "should get edit" do
    log_in_as(@user)
    get edit_account_address_url(account_id: @account.id, id: @address.id)
    assert_response :success
  end

  test "should redirect edit when not logged in" do
    get edit_account_address_url(account_id: @account.id, id: @address.id)
    assert_redirected_to login_url
  end

  test "should create address" do
    log_in_as(@user)
    assert_difference('Address.count') do
      post account_addresses_url(account_id: @account.id,
                                 address: { address_type: 2,
                                            address1: @address.address1,
                                            city: @address.city,
                                            state: @address.state,
                                            zip_code: @address.zip_code })
    end
    assert_redirected_to account_url(@account)
  end

  test "should redirect create address when not logged in" do
    assert_no_difference('Address.count') do
      post account_addresses_url(account_id: @account.id,
                                 address: { address_type: 3,
                                            address1: @address.address1,
                                            city: @address.city,
                                            state: @address.state,
                                            zip_code: @address.zip_code })
    end
    assert_redirected_to login_url
  end

  test "should update address" do
    log_in_as(@user)
    patch account_address_url(id: @account.id,
                              account_id: @account.id,
                               address: { address_type: 2,
                                          address1: "123 Test Lane",
                                          city: @address.city,
                                          state: @address.state,
                                          zip_code: @address.zip_code })

    assert_redirected_to account_url(@account)
  end

  test "should redirect update address when not logged in" do
    patch account_address_url(id: @account.id,
                              account_id: @account.id,
                               address: { address_type: 2,
                                          address1: "123 Test Lane",
                                          city: @address.city,
                                          state: @address.state,
                                          zip_code: @address.zip_code })
    assert_redirected_to login_url
  end

  test "should not destroy Delivery address" do
    log_in_as(@user)
    assert_no_difference 'Address.count' do
      delete account_address_url(id: @address.id,
                              account_id: @account.id)
    end
    assert_redirected_to account_url(@account)
  end

  test "should destroy Mailing address" do
    log_in_as(@user)
    assert_difference 'Address.count', -1 do
      delete account_address_url(id: @mail_address.id,
                              account_id: @mail_account.id)
    end
    assert_redirected_to account_url(@mail_account)
  end

  test "should not destroy address when not logged in" do
    assert_no_difference 'Address.count' do
      delete account_address_url(id: @address.id,
                              account_id: @account.id)
    end
    assert_redirected_to login_url
  end

  test "destroying account should delete addresses" do
    log_in_as(@user)
    assert_difference 'Address.count', -2 do
      delete account_url(@mail_account.id)
    end
    assert_redirected_to accounts_url
  end
end
