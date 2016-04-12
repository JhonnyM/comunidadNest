require 'test_helper'

class LicitacionImagenesControllerTest < ActionController::TestCase
  setup do
    @licitacion_imagen = licitacion_imagenes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:licitacion_imagenes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create licitacion_imagen" do
    assert_difference('LicitacionImagen.count') do
      post :create, licitacion_imagen: { descripcion: @licitacion_imagen.descripcion, imagen: @licitacion_imagen.imagen, producto_id: @licitacion_imagen.producto_id, producto_token: @licitacion_imagen.producto_token }
    end

    assert_redirected_to licitacion_imagen_path(assigns(:licitacion_imagen))
  end

  test "should show licitacion_imagen" do
    get :show, id: @licitacion_imagen
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @licitacion_imagen
    assert_response :success
  end

  test "should update licitacion_imagen" do
    patch :update, id: @licitacion_imagen, licitacion_imagen: { descripcion: @licitacion_imagen.descripcion, imagen: @licitacion_imagen.imagen, producto_id: @licitacion_imagen.producto_id, producto_token: @licitacion_imagen.producto_token }
    assert_redirected_to licitacion_imagen_path(assigns(:licitacion_imagen))
  end

  test "should destroy licitacion_imagen" do
    assert_difference('LicitacionImagen.count', -1) do
      delete :destroy, id: @licitacion_imagen
    end

    assert_redirected_to licitacion_imagenes_path
  end
end
