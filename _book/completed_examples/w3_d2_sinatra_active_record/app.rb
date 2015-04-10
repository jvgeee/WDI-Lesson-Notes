require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

# Load models
require_relative 'models/artist'
require_relative 'models/song'

# Load controllers
require_relative 'controllers/artistsController'
require_relative 'controllers/songsController'

# Load ActiveRecord and connect to the DB
ActiveRecord::Base.establish_connection({
  database: 'tunr_db',
  adapter: 'postgresql'
})

# Close connection
after do
  ActiveRecord::Base.connection.close
end

# General route actions
get '/' do
  erb :home
end

get '/about' do
  erb :about
end