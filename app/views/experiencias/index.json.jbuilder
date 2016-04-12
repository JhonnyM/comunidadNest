json.array!(@experiencias) do |experiencia|
  json.extract! experiencia, :id
  json.url experiencia_url(experiencia, format: :json)
end
