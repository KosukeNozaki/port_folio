require 'test_helper'

class Admins::CardsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_cards_index_url
    assert_response :success
  end

  test "should get new" do
    get admins_cards_new_url
    assert_response :success
  end

  test "should get create" do
    get admins_cards_create_url
    assert_response :success
  end

  test "should get show" do
    get admins_cards_show_url
    assert_response :success
  end

  test "should get edit" do
    get admins_cards_edit_url
    assert_response :success
  end

  test "should get update" do
    get admins_cards_update_url
    assert_response :success
  end

end
