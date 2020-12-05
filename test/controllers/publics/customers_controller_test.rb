require 'test_helper'

class Publics::CustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get publics_customers_show_url
    assert_response :success
  end

  test "should get edit" do
    get publics_customers_edit_url
    assert_response :success
  end

  test "should get update" do
    get publics_customers_update_url
    assert_response :success
  end

  test "should get index" do
    get publics_customers_index_url
    assert_response :success
  end

  test "should get status" do
    get publics_customers_status_url
    assert_response :success
  end

end
