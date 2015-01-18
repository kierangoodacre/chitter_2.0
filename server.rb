
require 'sinatra'
require 'data_mapper'
require './lib/link'
require './lib/user'
require './lib/helpers/application'
require './lib/data_mapper_setup'


enable :sessions
set :session_secret, 'super secret'


get '/' do
	erb :index
end

get '/users/new' do
  erb :"users/new"
end

post '/users' do
  user = User.create(:email => params[:email],
                     :password => params[:password])
  session[:user_id] = user.id
  redirect to('/')
end