require 'test_helper'

class EstudiosControllerTest < ActionController::TestCase
  setup do
    @estudio = estudios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:estudios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create estudio" do
    assert_difference('Estudio.count') do
      post :create, estudio: {  }
    end

    assert_redirected_to estudio_path(assigns(:estudio))
  end

  test "should show estudio" do
    get :show, id: @estudio
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @estudio
    assert_response :success
  end

  test "should update estudio" do
    patch :update, id: @estudio, estudio: {  }
    assert_redirected_to estudio_path(assigns(:estudio))
  end

  test "should destroy estudio" do
    assert_difference('Estudio.count', -1) do
      delete :destroy, id: @estudio
    end

    assert_redirected_to estudios_path
  end
end
