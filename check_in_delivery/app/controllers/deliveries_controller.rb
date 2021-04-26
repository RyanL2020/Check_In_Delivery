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
      if current_user.id == @delivery.user_id 
        erb :"/deliveries/complete"
      else
        redirect "/login"
      end 
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
      if current_user.id == @delivery.user_id 
        erb :"/deliveries/show.html"
      else
        redirect "/login"
      end 
    else 
      redirect "/login"
    end
  end
       
  get "/deliveries/:id/check_in" do
    if logged_in?
     @delivery = Delivery.find_by_id(params[:id])
     if current_user.id == @delivery.user_id 
       erb :"/deliveries/check_in"
     else 
       redirect "/login"
     end 
    else
      redirect "/login"
    end 
  end 
     
  patch "/deliveries/:id" do
     @delivery = Delivery.find_by_id(params[:id])
     params.delete("_method")
     @delivery.checked_in = true
     @delivery.update(params)
     redirect "/deliveries/#{@delivery.id}/complete"
  end
       
    post "/deliveries" do
      delivery = current_user.deliveries.build(params)
      delivery.checked_in = false 
      if delivery.save
      redirect "/deliveries"
    else
      redirect "deliveries/new"
      
    end
  end
     
   get "/deliveries/:id/edit" do
      if logged_in?
       @delivery = Delivery.find_by_id(params[:id])
       if current_user.id == @delivery.user_id 
          erb :"/deliveries/edit.html"
       else 
          redirect "/login"
       end 
      else
        redirect "/login"
      end 
   end
   
   
   delete "/deliveries/:id" do
    @delivery = Delivery.find_by_id(params[:id])
   if current_user.id == @delivery.user_id
      @delivery.destroy
      params.delete("_method")
      redirect "/deliveries"
   else
      redirect "/users/#{@user.id}"
    end
   end 
    
end

    

       
       
     

   
       
         
     

      



    

