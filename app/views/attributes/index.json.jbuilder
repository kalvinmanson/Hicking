json.array!(@attributes) do |attribute|
  json.extract! attribute, :id, :place_id, :user_id, :option_id, :name, :active
  json.url attribute_url(attribute, format: :json)
end
