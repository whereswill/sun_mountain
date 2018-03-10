require 'test_helper'

class AddressTest < ActiveSupport::TestCase

  def setup
    @account = addresses(:one)
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
