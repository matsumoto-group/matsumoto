require 'test_helper'

class Admin::AlbumControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_album_new_url
    assert_response :success
  end

  test "should get create　edit" do
    get admin_album_create　edit_url
    assert_response :success
  end

  test "should get show" do
    get admin_album_show_url
    assert_response :success
  end

end
