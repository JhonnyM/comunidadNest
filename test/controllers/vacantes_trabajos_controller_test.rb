require 'test_helper'

class VacantesTrabajosControllerTest < ActionController::TestCase
  setup do
    @vacantes_trabajo = vacantes_trabajos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vacantes_trabajos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vacantes_trabajo" do
    assert_difference('VacantesTrabajo.count') do
      post :create, vacantes_trabajo: { descripcion_puesto: @vacantes_trabajo.descripcion_puesto, desripcion: @vacantes_trabajo.desripcion, empresa_id: @vacantes_trabajo.empresa_id, pais: @vacantes_trabajo.pais, puesto: @vacantes_trabajo.puesto, requisitos: @vacantes_trabajo.requisitos, salario: @vacantes_trabajo.salario, tiempo: @vacantes_trabajo.tiempo, titulo: @vacantes_trabajo.titulo }
    end

    assert_redirected_to vacantes_trabajo_path(assigns(:vacantes_trabajo))
  end

  test "should show vacantes_trabajo" do
    get :show, id: @vacantes_trabajo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vacantes_trabajo
    assert_response :success
  end

  test "should update vacantes_trabajo" do
    patch :update, id: @vacantes_trabajo, vacantes_trabajo: { descripcion_puesto: @vacantes_trabajo.descripcion_puesto, desripcion: @vacantes_trabajo.desripcion, empresa_id: @vacantes_trabajo.empresa_id, pais: @vacantes_trabajo.pais, puesto: @vacantes_trabajo.puesto, requisitos: @vacantes_trabajo.requisitos, salario: @vacantes_trabajo.salario, tiempo: @vacantes_trabajo.tiempo, titulo: @vacantes_trabajo.titulo }
    assert_redirected_to vacantes_trabajo_path(assigns(:vacantes_trabajo))
  end

  test "should destroy vacantes_trabajo" do
    assert_difference('VacantesTrabajo.count', -1) do
      delete :destroy, id: @vacantes_trabajo
    end

    assert_redirected_to vacantes_trabajos_path
  end
end
