
require 'sinatra'
require 'sinatra/contrib/all'

get '/' do
  erb :home
end

get '/basic_calc' do
  erb :calc
end

post '/calc' do
  @first = params[:first].to_f
  @second = params[:second].to_f
  @operator = params[:operator]

  @result = case @operator
    when "+" then @first + @second
    when "-" then @first - @second
    when "*" then @first * @second
    when "/" then @first / @second
  end

  erb :result
end

get '/bmi' do
  erb :bmi
end

post "/bmi_calc" do
  @weight = params[:weight].to_f
  @height = params[:height].to_f
  puts params.inspect
  @bmi_result = ( @weight/(@height**2) )*703
  erb :result
end




