json.array!(@industrias) do |industria|
  json.extract! industria, :id
  json.url industria_url(industria, format: :json)
end
