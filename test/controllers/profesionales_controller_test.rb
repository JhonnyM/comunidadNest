require 'test_helper'

class ProfesionalesControllerTest < ActionController::TestCase
  setup do
    @profesional = profesionales(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:profesionales)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create profesional" do
    assert_difference('Profesional.count') do
      post :create, profesional: { cfia: @profesional.cfia, ciudad: @profesional.ciudad, descripcion: @profesional.descripcion, email: @profesional.email, especialidades: @profesional.especialidades, estado_civil: @profesional.estado_civil, facebook: @profesional.facebook, genero: @profesional.genero, instagram: @profesional.instagram, intereses: @profesional.intereses, linkedin: @profesional.linkedin, movil: @profesional.movil, nacimiento: @profesional.nacimiento, nombre: @profesional.nombre, otros: @profesional.otros, pais: @profesional.pais, pinterest: @profesional.pinterest, status: @profesional.status, telefono: @profesional.telefono, twitter: @profesional.twitter, user_id: @profesional.user_id, website: @profesional.website }
    end

    assert_redirected_to profesional_path(assigns(:profesional))
  end

  test "should show profesional" do
    get :show, id: @profesional
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @profesional
    assert_response :success
  end

  test "should update profesional" do
    patch :update, id: @profesional, profesional: { cfia: @profesional.cfia, ciudad: @profesional.ciudad, descripcion: @profesional.descripcion, email: @profesional.email, especialidades: @profesional.especialidades, estado_civil: @profesional.estado_civil, facebook: @profesional.facebook, genero: @profesional.genero, instagram: @profesional.instagram, intereses: @profesional.intereses, linkedin: @profesional.linkedin, movil: @profesional.movil, nacimiento: @profesional.nacimiento, nombre: @profesional.nombre, otros: @profesional.otros, pais: @profesional.pais, pinterest: @profesional.pinterest, status: @profesional.status, telefono: @profesional.telefono, twitter: @profesional.twitter, user_id: @profesional.user_id, website: @profesional.website }
    assert_redirected_to profesional_path(assigns(:profesional))
  end

  test "should destroy profesional" do
    assert_difference('Profesional.count', -1) do
      delete :destroy, id: @profesional
    end

    assert_redirected_to profesionales_path
  end
end
