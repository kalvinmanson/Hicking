json.array!(@comments) do |comment|
  json.extract! comment, :id, :user_id, :place_id, :content, :active
  json.url comment_url(comment, format: :json)
end
