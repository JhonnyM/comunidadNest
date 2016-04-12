json.array!(@participante_proyectos) do |participante_proyecto|
  json.extract! participante_proyecto, :id
  json.url participante_proyecto_url(participante_proyecto, format: :json)
end
