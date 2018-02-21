require 'test_helper'

class DeliveriesEditTest < ActionDispatch::IntegrationTest

  def setup
    @delivery = deliveries(:one)
    @admin_user = users(:michael)
    log_in_as(@admin_user)
  end

  test "unsuccessful edit with invalid info" do
    get edit_delivery_path(@delivery)
    assert_template 'deliveries/edit'
    patch delivery_path(@delivery), params: { delivery: { address1:  "",
                                              city: "",
                                              state:  "",
                                              zip_code: "" } }

    assert_template 'deliveries/edit'
    # assert_select 'div.alert-danger', "The form contains 4 errors."
  end

  test "successful edit for admin" do
    get edit_delivery_path(@delivery)
    assert_template 'deliveries/edit'
    address1  = "333 N. High St."
    zip_code = "89076"
    patch delivery_path(@delivery), params: { delivery: { address1:  address1,
                                              city: "Golden",
                                              state:  "CO",
                                              zip_code: zip_code } }
    assert_not flash.empty?
    assert_redirected_to @delivery
    @delivery.reload
    assert_equal address1,  @delivery.address1
    assert_equal zip_code, @delivery.zip_code
  end
end
