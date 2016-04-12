require 'test_helper'

class IndustriaControllerTest < ActionController::TestCase
  setup do
    @industrium = industria(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:industria)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create industrium" do
    assert_difference('Industrium.count') do
      post :create, industrium: { nombre: @industrium.nombre }
    end

    assert_redirected_to industrium_path(assigns(:industrium))
  end

  test "should show industrium" do
    get :show, id: @industrium
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @industrium
    assert_response :success
  end

  test "should update industrium" do
    patch :update, id: @industrium, industrium: { nombre: @industrium.nombre }
    assert_redirected_to industrium_path(assigns(:industrium))
  end

  test "should destroy industrium" do
    assert_difference('Industrium.count', -1) do
      delete :destroy, id: @industrium
    end

    assert_redirected_to industria_path
  end
end
