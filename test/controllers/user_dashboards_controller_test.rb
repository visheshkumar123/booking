require "test_helper"

class UserDashboardsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_dashboards_index_url
    assert_response :success
  end
end
