json.array!(@photos) do |photo|
  json.extract! photo, :id, :url, :description, :hits
  json.url photo_url(photo, format: :json)
end
