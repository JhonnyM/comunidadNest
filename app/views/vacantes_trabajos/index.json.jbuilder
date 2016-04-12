json.array!(@vacantes_trabajos) do |vacantes_trabajo|
  json.extract! vacantes_trabajo, :id, :titulo, :empresa_id, :pais, :desripcion, :puesto, :descripcion_puesto, :requisitos, :tiempo, :salario
  json.url vacantes_trabajo_url(vacantes_trabajo, format: :json)
end
