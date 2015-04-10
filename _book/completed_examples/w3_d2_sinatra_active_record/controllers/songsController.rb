# index
get "/songs" do
  @songs = Song.all
  erb(:"songs/index")
end

# new
get "/songs/new" do
  @artists = Artist.all
  erb(:"songs/new")
end

# create
post "/songs" do
  @song = Song.create!(params[:song])
  redirect("/songs/#{@song.id}")
end

#show
get "/songs/:id" do
  @song   = Song.find(params[:id])
  @artist = Artist.find(@song.artist_id)
  erb(:"songs/show")
end

# edit
get "/songs/:id/edit" do
  @song = Song.find(params[:id])
  erb(:"songs/edit")
end

# update
post "/songs/:id/update" do
  @song = Song.find(params[:id])
  @song.update(params[:song])
  redirect("/songs/#{@song.id}")
end

# destroy
post "/songs/:id/delete" do
  @song = Song.find(params[:id])
  erb(:"songs/index")
end
