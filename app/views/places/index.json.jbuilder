json.array!(@places) do |place|
  json.extract! place, :id, :user_id, :city_id, :name, :slug, :content, :active
  json.url place_url(place, format: :json)
end
