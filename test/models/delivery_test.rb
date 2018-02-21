require 'test_helper'

class DeliveryTest < ActiveSupport::TestCase

  def setup
    @delivery = Delivery.new(address1: "123 N. Main St.", city: "Springfield",
                     state: "OR", zip_code: "97990")
  end

  test "should be valid" do
    assert @delivery.valid?
  end

  test "address1 should be present" do
    @delivery.address1 = "     "
    assert_not @delivery.valid?
  end

  test "city should be present" do
    @delivery.city = "     "
    assert_not @delivery.valid?
  end

  test "state should be present" do
    @delivery.state = "     "
    assert_not @delivery.valid?
  end

  test "zip should be present" do
    @delivery.zip_code = "     "
    assert_not @delivery.valid?
  end
end
