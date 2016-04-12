require 'test_helper'

class LicitacionsControllerTest < ActionController::TestCase
  setup do
    @licitacion = licitacions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:licitacions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create licitacion" do
    assert_difference('Licitacion.count') do
      post :create, licitacion: { cantidad: @licitacion.cantidad, entrega: @licitacion.entrega, especificaciones: @licitacion.especificaciones, observaciones: @licitacion.observaciones, pais: @licitacion.pais, plazo: @licitacion.plazo, precio_maximo: @licitacion.precio_maximo, precio_minimo: @licitacion.precio_minimo, producto_categoria_id: @licitacion.producto_categoria_id, tipo_de_cambio: @licitacion.tipo_de_cambio, titulo: @licitacion.titulo, unidad_medida: @licitacion.unidad_medida }
    end

    assert_redirected_to licitacion_path(assigns(:licitacion))
  end

  test "should show licitacion" do
    get :show, id: @licitacion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @licitacion
    assert_response :success
  end

  test "should update licitacion" do
    patch :update, id: @licitacion, licitacion: { cantidad: @licitacion.cantidad, entrega: @licitacion.entrega, especificaciones: @licitacion.especificaciones, observaciones: @licitacion.observaciones, pais: @licitacion.pais, plazo: @licitacion.plazo, precio_maximo: @licitacion.precio_maximo, precio_minimo: @licitacion.precio_minimo, producto_categoria_id: @licitacion.producto_categoria_id, tipo_de_cambio: @licitacion.tipo_de_cambio, titulo: @licitacion.titulo, unidad_medida: @licitacion.unidad_medida }
    assert_redirected_to licitacion_path(assigns(:licitacion))
  end

  test "should destroy licitacion" do
    assert_difference('Licitacion.count', -1) do
      delete :destroy, id: @licitacion
    end

    assert_redirected_to licitacions_path
  end
end
