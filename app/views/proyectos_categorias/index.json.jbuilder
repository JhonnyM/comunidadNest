json.array!(@proyectos_categorias) do |proyectos_categoria|
  json.extract! proyectos_categoria, :id, :nombre
  json.url proyectos_categoria_url(proyectos_categoria, format: :json)
end
