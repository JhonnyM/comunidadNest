json.array!(@producto_imagenes) do |producto_imagen|
  json.extract! producto_imagen, :id, :descripcion, :imagen, :producto_id, :producto_token
  json.url producto_imagen_url(producto_imagen, format: :json)
end
