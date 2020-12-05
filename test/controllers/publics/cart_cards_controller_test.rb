require 'test_helper'

class Publics::CartCardsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get publics_cart_cards_index_url
    assert_response :success
  end

  test "should get update" do
    get publics_cart_cards_update_url
    assert_response :success
  end

  test "should get destroy" do
    get publics_cart_cards_destroy_url
    assert_response :success
  end

  test "should get all_destroy" do
    get publics_cart_cards_all_destroy_url
    assert_response :success
  end

  test "should get create" do
    get publics_cart_cards_create_url
    assert_response :success
  end

end
