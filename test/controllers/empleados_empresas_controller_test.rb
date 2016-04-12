require 'test_helper'

class EmpleadosEmpresasControllerTest < ActionController::TestCase
  setup do
    @empleados_empresa = empleados_empresas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:empleados_empresas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create empleados_empresa" do
    assert_difference('EmpleadosEmpresa.count') do
      post :create, empleados_empresa: {  }
    end

    assert_redirected_to empleados_empresa_path(assigns(:empleados_empresa))
  end

  test "should show empleados_empresa" do
    get :show, id: @empleados_empresa
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @empleados_empresa
    assert_response :success
  end

  test "should update empleados_empresa" do
    patch :update, id: @empleados_empresa, empleados_empresa: {  }
    assert_redirected_to empleados_empresa_path(assigns(:empleados_empresa))
  end

  test "should destroy empleados_empresa" do
    assert_difference('EmpleadosEmpresa.count', -1) do
      delete :destroy, id: @empleados_empresa
    end

    assert_redirected_to empleados_empresas_path
  end
end
