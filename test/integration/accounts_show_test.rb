require 'test_helper'

class AccountsShowTest < ActionDispatch::IntegrationTest

  def setup
    @account = accounts(:two)
    @admin     = users(:michael)
    @non_admin = users(:archer)
  end

  test "accounts as logged-in user" do
    log_in_as(@non_admin)
    get account_path(@account)
    assert_template 'accounts/show'
    assert_select 'a[href=?]', edit_account_path(@account)
    assert_select 'a[href=?]', edit_account_address_path(@account)
    assert_select 'h1', "Account Number: #{@account.account_number}"
    assert_select 'h3', 'Account Info'
    assert_select 'h3', 'Notes'
    assert_select 'h3', 'Delivery Address'
    assert_select 'h3', 'Mailing Address'
    assert_select 'h3', 'Invoice History'
  end
end
