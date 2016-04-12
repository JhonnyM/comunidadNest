require 'test_helper'

class ProductoImagenesControllerTest < ActionController::TestCase
  setup do
    @producto_imagen = producto_imagenes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:producto_imagenes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create producto_imagen" do
    assert_difference('ProductoImagen.count') do
      post :create, producto_imagen: { descripcion: @producto_imagen.descripcion, imagen: @producto_imagen.imagen, producto_id: @producto_imagen.producto_id, producto_token: @producto_imagen.producto_token }
    end

    assert_redirected_to producto_imagen_path(assigns(:producto_imagen))
  end

  test "should show producto_imagen" do
    get :show, id: @producto_imagen
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @producto_imagen
    assert_response :success
  end

  test "should update producto_imagen" do
    patch :update, id: @producto_imagen, producto_imagen: { descripcion: @producto_imagen.descripcion, imagen: @producto_imagen.imagen, producto_id: @producto_imagen.producto_id, producto_token: @producto_imagen.producto_token }
    assert_redirected_to producto_imagen_path(assigns(:producto_imagen))
  end

  test "should destroy producto_imagen" do
    assert_difference('ProductoImagen.count', -1) do
      delete :destroy, id: @producto_imagen
    end

    assert_redirected_to producto_imagenes_path
  end
end
