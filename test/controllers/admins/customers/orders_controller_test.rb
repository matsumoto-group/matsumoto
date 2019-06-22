require 'test_helper'

class Admins::Customers::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get destroy" do
    get admins_customers_orders_destroy_url
    assert_response :success
  end

end
