require 'test_helper'

class Publics::SearchesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get publics_searches_index_url
    assert_response :success
  end

end
