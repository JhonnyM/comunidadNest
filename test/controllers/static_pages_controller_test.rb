require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get inicio" do
    get :inicio
    assert_response :success
  end

  test "should get nosotros" do
    get :nosotros
    assert_response :success
  end

  test "should get contacto" do
    get :contacto
    assert_response :success
  end

  test "should get privacidad" do
    get :privacidad
    assert_response :success
  end

  test "should get terminos" do
    get :terminos
    assert_response :success
  end

end
