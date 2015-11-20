json.array!(@countries) do |country|
  json.extract! country, :id, :name, :country_code
  json.url country_url(country, format: :json)
end
