require 'sinatra'
require 'data_mapper'
require './lib/link'
require './lib/user'
require './lib/helpers/application'
require './lib/data_mapper_setup'
require 'rack-flash'
require './lib/tweet'
require 'sinatra/partial'

set :public_folder, Proc.new { File.join(root, "..", "/public") }
enable :sessions
set :session_secret, 'super secret'
use Rack::Flash
use Rack::MethodOverride

get '/' do
  @tweets = Tweet.all
  erb :index
end

get '/users/new' do
  @user = User.new
  erb :"users/new"
end

post '/users' do
  @user = User.new(:email => params[:email],
              :username => params[:username], 
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

get '/sessions/new' do
  erb :"sessions/new"
end

post '/sessions' do
  email, username, password = params[:email], params[:username], params[:password]
  user = User.authenticate(email, username, password)
  if user
    session[:user_id] = user.id
    redirect to('/')
  else
    flash[:errors] = ["The email or password is incorrect"]
    erb :"sessions/new"
  end
end

delete '/sessions' do
  flash[:notice] = "Good bye!"
  session[:user_id] = nil
  redirect to('/')
end

post '/tweets' do
  tweet = params["tweet"]
  Tweet.create(:text => tweet)
  redirect to('/')
end

get '/tags/:text' do
  peep = Tweet.first(:text => params[:text])
  @tweets = peep ? peep.tweets : []
  erb :index
end