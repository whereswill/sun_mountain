require 'test_helper'

class AccountTest < ActiveSupport::TestCase

  def setup
    @account = Account.new(address1: "123 N. Main St.", city: "Springfield",
                     state: "OR", zip_code: "97990")
  end

  test "should be valid" do
    assert @account.valid?
  end

  test "address1 should be present" do
    @account.address1 = "     "
    assert_not @account.valid?
  end

  test "city should be present" do
    @account.city = "     "
    assert_not @account.valid?
  end

  test "state should be present" do
    @account.state = "     "
    assert_not @account.valid?
  end

  test "zip should be present" do
    @account.zip_code = "     "
    assert_not @account.valid?
  end
end
