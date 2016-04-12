json.array!(@empresas) do |empresa|
  json.extract! empresa, :id, :industria_id, :telefono, :telefono2, :email, :servicios, :horario, :empleados, :fundacion
  json.url empresa_url(empresa, format: :json)
end
