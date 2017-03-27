require 'test_helper'

class UsuarioControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get usuario_new_url
    assert_response :success
  end

  test "should get show" do
    get usuario_show_url
    assert_response :success
  end

  test "should get edit" do
    get usuario_edit_url
    assert_response :success
  end

  test "should get index" do
    get usuario_index_url
    assert_response :success
  end

  test "should get destroy" do
    get usuario_destroy_url
    assert_response :success
  end

end
