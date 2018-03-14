require 'test_helper'

class AddressTest < ActiveSupport::TestCase

  def setup
    @address = addresses(:one)
  end

  test "address_type should be present" do
    @address.address_type = "     "
    assert_not @address.valid?
  end

  test "address1 should be present" do
    @address.address1 = "     "
    assert_not @address.valid?
  end

  test "city should be present" do
    @address.city = "     "
    assert_not @address.valid?
  end

  test "state should be present" do
    @address.state = "     "
    assert_not @address.valid?
  end

  test "zip should be present" do
    @address.zip_code = "     "
    assert_not @address.valid?
  end

  test "account_number and address_type should be unique" do
    duplicate_address = @address.dup
    @address.save
    assert_not duplicate_address.valid?
  end
end
