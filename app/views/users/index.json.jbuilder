json.array!(@users) do |user|
  json.extract! user, :id, :city_id, :name, :rol
  json.url user_url(user, format: :json)
end
