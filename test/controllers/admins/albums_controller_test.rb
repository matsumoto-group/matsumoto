require 'test_helper'

class Admins::AlbumsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_albums_index_url
    assert_response :success
  end

  test "should get show" do
    get admins_albums_show_url
    assert_response :success
  end

  test "should get edit" do
    get admins_albums_edit_url
    assert_response :success
  end

  test "should get new" do
    get admins_albums_new_url
    assert_response :success
  end

end
