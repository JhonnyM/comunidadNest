json.array!(@proyectos) do |proyecto|
  json.extract! proyecto, :id, :titulo, :descripcion, :pais, :ciudad, :area, :fecha, :proyectos_categoria_id, :status_proyecto, :status, :user_id
  json.url proyecto_url(proyecto, format: :json)
end
