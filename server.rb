
require 'sinatra'
require 'data_mapper'
require './lib/link'
require './lib/user'
require './lib/helpers/application'
require './lib/data_mapper_setup'
require 'rack-flash'


enable :sessions
set :session_secret, 'super secret'
use Rack::Flash
use Rack::MethodOverride

get '/' do
	erb :index
end

get '/users/new' do
  @user = User.new
  erb :"users/new"
end

post '/users' do
  @user = User.new(:email => params[:email], 
              :password => params[:password],
              :password_confirmation => params[:password_confirmation])  
  if @user.save
    session[:user_id] = @user.id
    redirect to('/')
  else
    flash.now[:errors] = @user.errors.full_messages
    erb :"users/new"
  end
end