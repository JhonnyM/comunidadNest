json.array!(@empleados_empresas) do |empleados_empresa|
  json.extract! empleados_empresa, :id
  json.url empleados_empresa_url(empleados_empresa, format: :json)
end
