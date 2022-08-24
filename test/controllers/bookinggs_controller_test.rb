require "test_helper"

class BookinggsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bookinggs_index_url
    assert_response :success
  end

  test "should get show" do
    get bookinggs_show_url
    assert_response :success
  end

  test "should get create" do
    get bookinggs_create_url
    assert_response :success
  end

  test "should get update" do
    get bookinggs_update_url
    assert_response :success
  end

  test "should get edit" do
    get bookinggs_edit_url
    assert_response :success
  end

  test "should get new" do
    get bookinggs_new_url
    assert_response :success
  end
end
