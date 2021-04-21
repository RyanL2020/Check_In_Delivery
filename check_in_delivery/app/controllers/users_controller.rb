class UsersController < ApplicationController

  get "/users" do
    if logged_in?
      @users = User.all
      erb :"/users/index.html"
    else
      redirect "/login"
    end
  end
      
  
  post "/users" do
    @user = User.new(params)
    if @user && @user.save
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    else
      redirect "/users/new"
    end
  end
  
  get "/users/new" do
    if logged_in?
      erb :"users/new.html"
    else
      redirect "/login"
    end
  end 
  
  get "/users/:id" do
    if logged_in?
      @user = User.find_by_id(params[:id])
      erb :"/users/show.html"
    else
      redirect "/login"
    end 
  end

  delete "/users/:id/delete" do
    @user = User.find_by_id(params[:id])
    @user.destroy
    redirect "/users"
  end
end 


  
  
  


 
  
  get "/users/:id/edit" do
    erb :"/users/edit.html"
  end


  patch "/users/:id" do
    redirect "/users/:id"
  end



