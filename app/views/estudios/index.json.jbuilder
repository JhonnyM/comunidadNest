json.array!(@estudios) do |estudio|
  json.extract! estudio, :id
  json.url estudio_url(estudio, format: :json)
end
