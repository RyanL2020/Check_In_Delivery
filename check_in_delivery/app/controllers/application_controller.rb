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


  post "/login" do 
    redirect "/deliveries"
  end 

end
