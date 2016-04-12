json.array!(@profesionales) do |profesional|
  json.extract! profesional, :id, :status, :user_id, :nombre, :especialidades, :descripcion, :email, :telefono, :movil, :website, :facebook, :twitter, :instagram, :pinterest, :linkedin, :pais, :ciudad, :otros, :genero, :nacimiento, :estado_civil, :intereses, :cfia
  json.url profesional_url(profesional, format: :json)
end
