require "test_helper"

class PropertyOwnerDashboardsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get property_owner_dashboards_index_url
    assert_response :success
  end
end
