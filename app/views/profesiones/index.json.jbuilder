json.array!(@profesiones) do |profesion|
  json.extract! profesion, :id, :generico, :masculino, :femenino
  json.url profesion_url(profesion, format: :json)
end
