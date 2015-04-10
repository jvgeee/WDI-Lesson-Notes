require "sinatra"
require "sinatra/reloader"
require "pg"


#REST: index
get "/" do
  sql = "SELECT * FROM people"
  @friends = run_sql(sql)
  erb :home
end

#REST: new
get "/people/new" do
  erb :new
end

#REST: show
get "/people/:id" do
  sql = "SELECT * FROM people WHERE id= #{params[:id]}"
  @friend = run_sql(sql)[0]
  erb :show
end



#REST: create
post "/people" do
  name = params[:name].split
  dob = params[:dob]
  relationship = params[:relationship]
  friends = params[:friends]
  city = params[:city]

  sql = "INSERT INTO people (first, last, dob, relationship, city, friends) VALUES ('#{name[0]}', '#{name[1]}', '#{dob}', '#{relationship}', '#{city}', '#{friends}')"
  run_sql(sql)
  redirect "/"
end

#REST: edit
#REST: update
#REST: delete

def run_sql(sql)
  connection = PG.connect(dbname: "facebook_lab", host: "localhost")
  result = connection.exec(sql)
  connection.close
  result
end















