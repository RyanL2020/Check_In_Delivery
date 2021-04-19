class DeliveriesController < ApplicationController

  get "/deliveries" do
    @deliveries = Delivery.all
    erb :"/deliveries/index.html"
  end
       
  get "/deliveries/:id/complete" do
    @delivery = Delivery.find_by_id(params[:id])
    erb :"/deliveries/complete"
  end 

  get "/deliveries/new" do
    @delivery = Delivery.new(params)
     if @delivery.save 
      redirect "/deliveries/#{@delivery.id}/check_in"
     else
      #error message 
      redirect "/deliveries/new"
    end
  end
       
  get "/deliveries/:id" do
    @delivery = Delivery.find_by_id(params[:id])
    erb :"/deliveries/show.html"
  end
       
  get "/deliveries/:id/check_in" do
    @delivery = Delivery.find_by_id(params[:id])
     erb :"/deliveries/check_in"
  end 
     
  patch "/deliveries/:id" do
     @delivery = Delivery.find_by_id(params[:id])
     params.delete("_method")
     @delivery.update(params)
     redirect "/deliveries/#{@delivery.id}/complete"
  end
       
    post "/deliveries" do
      delivery = Delivery.new(params)
      if delivery.save
      redirect "/deliveries/#{delivery.id}/check_in"
    else
      redirect "deliveries/new"
      
    end
  end
     
   get "/deliveries/:id/edit" do
     @delivery = Delivery.find_by_id(params[:id])
     erb :"/deliveries/edit.html"
   end
   
   delete "/deliveries/:id/delete" do
     @delivery = Delivery.find_by_id(params[:id])
     @delivery.destroy
    redirect "/deliveries"
   end
 end
       
       
     

   
       
         
     

      



    

