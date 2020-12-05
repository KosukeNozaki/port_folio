require 'test_helper'

class Publics::CardsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get publics_cards_index_url
    assert_response :success
  end

  test "should get show" do
    get publics_cards_show_url
    assert_response :success
  end

end
