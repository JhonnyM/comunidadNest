json.array!(@productos) do |producto|
  json.extract! producto, :id, :titulo, :propietario_id, :propietario_tipo, :product_type_id, :materiales, :diseñador, :codigo, :pais, :descripcion
  json.url producto_url(producto, format: :json)
end
