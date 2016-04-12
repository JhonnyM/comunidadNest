json.array!(@licitacions) do |licitacion|
  json.extract! licitacion, :id, :titulo, :pais, :cantidad, :unidad_medida, :producto_categoria_id, :especificaciones, :precio_minimo, :precio_maximo, :tipo_de_cambio, :entrega, :plazo, :observaciones
  json.url licitacion_url(licitacion, format: :json)
end
