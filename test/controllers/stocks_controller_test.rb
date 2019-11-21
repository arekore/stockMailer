require 'test_helper'

class StocksControllerTest < ActionDispatch::IntegrationTest
  test "should get list" do
    get stocks_list_url
    assert_response :success
  end

end
