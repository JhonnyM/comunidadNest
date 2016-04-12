json.array!(@licitacion_imagenes) do |licitacion_imagen|
  json.extract! licitacion_imagen, :id, :descripcion, :imagen, :producto_id, :producto_token
  json.url licitacion_imagen_url(licitacion_imagen, format: :json)
end
