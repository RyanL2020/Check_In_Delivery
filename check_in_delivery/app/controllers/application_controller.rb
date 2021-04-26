require './config/environment'
class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "asessionsecret" 
  end

  get "/" do
    erb :welcome
  end

  helpers do #tells sinatra these should be available everywhere

  def logged_in?
    session[:user_id]
  end 

  def current_user
    #going to return @user if set or find the user by id: session :user_id
   @user ||= User.find_by(id: session[:user_id])
  end 

  
  #def delivery_user_id
  
  #  Delivery.all.map { |delivery| delivery.user_id  }
  
  #end 
  
  end 

end

