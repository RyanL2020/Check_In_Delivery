class DeliveriesController < ApplicationController

  get "/deliveries" do
     if logged_in?
       @user = current_user
       @deliveries = Delivery.all
       erb :"/deliveries/index.html"
     else 
       redirect "/login"
    end
  end 

       
  get "/deliveries/:id/complete" do
    if logged_in?
      @delivery = Delivery.find_by_id(params[:id])
      erb :"/deliveries/complete"
    else
      redirect "/login"
    end 
  end 

  get "/deliveries/new" do
    if logged_in?
     erb :"/deliveries/new.html"
    else 
      redirect "/login"
   end
  end
       
  get "/deliveries/:id" do
    if logged_in?
      @delivery = Delivery.find_by_id(params[:id])
      erb :"/deliveries/show.html"
    else 
      redirect "/login"
    end
  end
       
  get "/deliveries/:id/check_in" do
    if logged_in?
     @delivery = Delivery.find_by_id(params[:id])
     erb :"/deliveries/check_in"
    else
      redirect "/login"
    end 
  end 
     
  patch "/deliveries/:id" do
     @delivery = Delivery.find_by_id(params[:id])
     params.delete("_method")
     @delivery.update(params)
     redirect "/deliveries/#{@delivery.id}/complete"
  end
       
    post "/deliveries" do
      #delivery = Delivery.new(params)
      delivery = current_user.deliveries.build(params)
      if delivery.save
      redirect "/deliveries/#{delivery.id}/check_in"
    else
      redirect "deliveries/new"
      
    end
  end
     
   get "/deliveries/:id/edit" do
      if logged_in?
       @delivery = Delivery.find_by_id(params[:id])
       erb :"/deliveries/edit.html"
      else
        redirect "/login"
      end 
   end
   
   
   delete "/deliveries/:id" do
     @delivery = Delivery.find_by_id(params[:id])
     @delivery.destroy
     params.delete("_method")
     redirect "/deliveries"
   end
 end
       
       
     

   
       
         
     

      



    

