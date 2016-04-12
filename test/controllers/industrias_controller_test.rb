require 'test_helper'

class IndustriasControllerTest < ActionController::TestCase
  setup do
    @industria = industrias(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:industrias)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create industria" do
    assert_difference('Industria.count') do
      post :create, industria: {  }
    end

    assert_redirected_to industria_path(assigns(:industria))
  end

  test "should show industria" do
    get :show, id: @industria
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @industria
    assert_response :success
  end

  test "should update industria" do
    patch :update, id: @industria, industria: {  }
    assert_redirected_to industria_path(assigns(:industria))
  end

  test "should destroy industria" do
    assert_difference('Industria.count', -1) do
      delete :destroy, id: @industria
    end

    assert_redirected_to industrias_path
  end
end
