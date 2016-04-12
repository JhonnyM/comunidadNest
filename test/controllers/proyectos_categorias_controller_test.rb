require 'test_helper'

class ProyectosCategoriasControllerTest < ActionController::TestCase
  setup do
    @proyectos_categoria = proyectos_categorias(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:proyectos_categorias)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create proyectos_categoria" do
    assert_difference('ProyectosCategoria.count') do
      post :create, proyectos_categoria: { nombre: @proyectos_categoria.nombre }
    end

    assert_redirected_to proyectos_categoria_path(assigns(:proyectos_categoria))
  end

  test "should show proyectos_categoria" do
    get :show, id: @proyectos_categoria
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @proyectos_categoria
    assert_response :success
  end

  test "should update proyectos_categoria" do
    patch :update, id: @proyectos_categoria, proyectos_categoria: { nombre: @proyectos_categoria.nombre }
    assert_redirected_to proyectos_categoria_path(assigns(:proyectos_categoria))
  end

  test "should destroy proyectos_categoria" do
    assert_difference('ProyectosCategoria.count', -1) do
      delete :destroy, id: @proyectos_categoria
    end

    assert_redirected_to proyectos_categorias_path
  end
end
