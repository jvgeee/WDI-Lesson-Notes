json.array!(@clubs) do |club|
  json.extract! club, :id, :name, :image, :description, :city_id
  json.url club_url(club, format: :json)
end
