require 'test_helper'

class UsesControllerTest < ActionController::TestCase
  setup do
    @use = uses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:uses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create use" do
    assert_difference('Use.count') do
      post :create, use: { display_name: @use.display_name, email: @use.email, first_name: @use.first_name, hashed_password: @use.hashed_password, last_name: @use.last_name, username: @use.username }
    end

    assert_redirected_to use_path(assigns(:use))
  end

  test "should show use" do
    get :show, id: @use
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @use
    assert_response :success
  end

  test "should update use" do
    put :update, id: @use, use: { display_name: @use.display_name, email: @use.email, first_name: @use.first_name, hashed_password: @use.hashed_password, last_name: @use.last_name, username: @use.username }
    assert_redirected_to use_path(assigns(:use))
  end

  test "should destroy use" do
    assert_difference('Use.count', -1) do
      delete :destroy, id: @use
    end

    assert_redirected_to uses_path
  end
end
