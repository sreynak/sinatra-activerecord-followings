require 'rubygems'
require 'sinatra'
require 'haml'

require "bundler/setup"

require 'sinatra/activerecord'
configure(:development){ 
  set :database, "sqlite3:///development.sqlite3" 
}

require './models'

require 'sinatra/base'
require 'rack-flash'

enable :sessions
use Rack::Flash, :sweep => true

set :sessions => true

def current_user
  @current_user ||= User.find(session[:user_id]) if session[:user_id]
end

helpers{ alias_method :current_user, :current_user }

get '/' do
  session[:user_id] = 1
  erb :index
end

get "/users/:id/follow" do
  user = User.find(params[:id])
  current_user.follow!(user) if user
  flash[:notice] = "User followed successfully."
  redirect "/"
end