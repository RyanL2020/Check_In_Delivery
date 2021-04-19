class UsersController < ApplicationController

  get "/users" do
    @users = User.all
    erb :"/users/index.html"
  end

  post "/users" do
    @user = User.new(params)
    if @user.save
    redirect "/users/#{@user.id}"
    else
      redirect "/users/new"
   end
 end
  
  get "/users/new" do
   erb :"users/new.html"
  end 
  
  get "/users/:id" do
    @user = User.find_by_id(params[:id])
    erb :"/users/show.html"
  end



  
  
  


 
  
  get "/users/:id/edit" do
    erb :"/users/edit.html"
  end


  patch "/users/:id" do
    redirect "/users/:id"
  end

  delete "/users/:id/delete" do
    redirect "/users"
  end
end 


