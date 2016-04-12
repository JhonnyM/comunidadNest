require 'test_helper'

class ParticipanteProyectosControllerTest < ActionController::TestCase
  setup do
    @participante_proyecto = participante_proyectos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:participante_proyectos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create participante_proyecto" do
    assert_difference('ParticipanteProyecto.count') do
      post :create, participante_proyecto: {  }
    end

    assert_redirected_to participante_proyecto_path(assigns(:participante_proyecto))
  end

  test "should show participante_proyecto" do
    get :show, id: @participante_proyecto
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @participante_proyecto
    assert_response :success
  end

  test "should update participante_proyecto" do
    patch :update, id: @participante_proyecto, participante_proyecto: {  }
    assert_redirected_to participante_proyecto_path(assigns(:participante_proyecto))
  end

  test "should destroy participante_proyecto" do
    assert_difference('ParticipanteProyecto.count', -1) do
      delete :destroy, id: @participante_proyecto
    end

    assert_redirected_to participante_proyectos_path
  end
end
