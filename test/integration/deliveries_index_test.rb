require 'test_helper'

class DeliveriesIndexTest < ActionDispatch::IntegrationTest

  def setup
    @delivery = deliveries(:one)
    @admin     = users(:michael)
    @non_admin = users(:archer)
  end

  test "deliveries as non-admin" do
    log_in_as(@non_admin)
    get deliveries_path
    assert_select 'a[href=?]', new_delivery_path
    assert_select 'a[href=?]', delivery_path(@delivery)
    assert_select 'a[href=?]', edit_delivery_path(@delivery)
    assert_select "i.glyphicon-trash", count: 0
    assert_select 'div.pagination'
  end

  test "deliveries as admin including pagination and delete links" do
    log_in_as(@admin)
    get deliveries_path
    assert_template 'deliveries/index'
    assert_select 'div.pagination'
    first_page_of_deliveries = Delivery.all.paginate(page: 1)
    first_page_of_deliveries.each do |del|
      assert_select 'a[href=?]', delivery_path(del)
      assert_select 'a[href=?]', edit_delivery_path(del)
      assert_select "i.glyphicon-trash"
    end
    assert_difference 'Delivery.count', -1 do
      delete delivery_path(@delivery)
    end
  end
end
