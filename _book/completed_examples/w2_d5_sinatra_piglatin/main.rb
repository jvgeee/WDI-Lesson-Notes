require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/assetpack'

# Load model
require './models/pig_latin'

# Manage assets, js and css loading and compression
register Sinatra::AssetPack
assets do
  js :application, [
    'js/*.js'
  ]

  css :application, [
    '/css/normalize.css',
    '/css/foundation.css',
    '/css/style.css'
  ]

  js_compression :jsmin
  css_compression :sass
end

# Controller actions
get '/' do 
  erb :home
end

post '/translate' do 
  # local variable, not needed in the view
  form_input = params[:translate]

  # instance variable, needed in the view
  @translation = PigLatin.translate(form_input)
  erb :home
end













