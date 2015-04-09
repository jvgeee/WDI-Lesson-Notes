require "sinatra"
require "sinatra/reloader"
require "pg"

#REST: index

get "/" do
  sql = "SELECT * FROM videos"
  @videos = run_sql(sql)
  erb :home
end


#new
get "/videos/new" do
  erb :new
end

#show 
get "/videos/:id" do # here :id is a dynamic segment
  sql = "SELECT * FROM videos WHERE id=#{params[:id]}"
  @video = run_sql(sql)[0]
  erb :show
end

get "/videos/:id/edit" do
  sql = "SELECT * FROM videos WHERE id=#{params[:id]}"
  @video = run_sql(sql)[0]
  erb :edit
end


#update 
post "/videos/:id" do
  title = params[:title]
  description = params[:description]
  url = params[:url]
  genre = params[:genre]

  sql = "UPDATE videos SET title='#{title}', description='#{description}', url='#{url}', genre='#{genre}' WHERE id='#{params[:id]}'"
  run_sql(sql)
  redirect "/"
end

#create
post "/videos" do
  title = params[:title]
  description = params[:description]
  url = params[:url]
  genre = params[:genre]

  sql = "INSERT INTO videos (title, description, url, genre) VALUES ('#{title}', '#{description}', '#{url}', '#{genre}')"
  run_sql(sql)
  redirect "/"
end

#delete 
get "/videos/:id/delete" do
  sql = "DELETE FROM videos WHERE id=#{params[:id]}"
  run_sql(sql)
  redirect "/"
end


def run_sql(sql)
  conn = PG.connect(dbname: 'youtube_app', host: 'localhost')
  result = conn.exec(sql)
  conn.close
  result
end