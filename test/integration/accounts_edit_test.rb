require 'test_helper'

class AccountsEditTest < ActionDispatch::IntegrationTest

  def setup
    @account = accounts(:one)
    @admin_user = users(:michael)
    log_in_as(@admin_user)
  end

  test "unsuccessful edit with invalid info" do
    get edit_account_path(@account)
    assert_template 'accounts/edit'
    patch account_path(@account), params: { account: { first_name:  "",
                                              last_name: "",
                                              phone:  "" } }

    assert_template 'accounts/edit'
    # assert_select 'div.alert-danger', "The form contains 4 errors."
  end

  test "successful edit for admin" do
    get edit_account_path(@account)
    assert_template 'accounts/edit'
    first_name  = "Howard"
    phone = "541-555-6666"
    patch account_path(@account), params: { account: { first_name:  first_name,
                                              last_name: "Johnson",
                                              phone:  phone } }
    assert_not flash.empty?
    assert_redirected_to @account
    @account.reload
    assert_equal first_name,  @account.first_name
    assert_equal phone, @account.phone
  end
end
