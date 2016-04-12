require 'test_helper'

class ProyectosControllerTest < ActionController::TestCase
  setup do
    @proyecto = proyectos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:proyectos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create proyecto" do
    assert_difference('Proyecto.count') do
      post :create, proyecto: { area: @proyecto.area, ciudad: @proyecto.ciudad, descripcion: @proyecto.descripcion, fecha: @proyecto.fecha, pais: @proyecto.pais, proyectos_categoria_id: @proyecto.proyectos_categoria_id, status: @proyecto.status, status_proyecto: @proyecto.status_proyecto, titulo: @proyecto.titulo, user_id: @proyecto.user_id }
    end

    assert_redirected_to proyecto_path(assigns(:proyecto))
  end

  test "should show proyecto" do
    get :show, id: @proyecto
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @proyecto
    assert_response :success
  end

  test "should update proyecto" do
    patch :update, id: @proyecto, proyecto: { area: @proyecto.area, ciudad: @proyecto.ciudad, descripcion: @proyecto.descripcion, fecha: @proyecto.fecha, pais: @proyecto.pais, proyectos_categoria_id: @proyecto.proyectos_categoria_id, status: @proyecto.status, status_proyecto: @proyecto.status_proyecto, titulo: @proyecto.titulo, user_id: @proyecto.user_id }
    assert_redirected_to proyecto_path(assigns(:proyecto))
  end

  test "should destroy proyecto" do
    assert_difference('Proyecto.count', -1) do
      delete :destroy, id: @proyecto
    end

    assert_redirected_to proyectos_path
  end
end
