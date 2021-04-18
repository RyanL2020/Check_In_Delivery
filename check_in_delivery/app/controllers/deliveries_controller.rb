class DeliveriesController < ApplicationController

  # GET: /deliveries
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
     
       
       
       
       # GET: /deliveries/new
     
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


      # POST: /deliveries



    # GET: /deliveries/5/edit
    get "/deliveries/:id/edit" do
    @delivery = Delivery.find_by_id(params[:id])
  
   erb :"/deliveries/edit.html"
  end



  # DELETE: /deliveries/5/delete
  delete "/deliveries/:id/delete" do
   redirect "/deliveries"
  end
end

#patch "/deliveries/:id" do
#  @delivery = Delivery.find_by_id(params[:id])
#  params.delete("_method")
#  @delivery.update(params)
#  redirect "/deliveries/:id"
#end
#patch "/deliveries/:id" do
#  delivery = Delivery.find_by_id(params[:id])
#   delivery.update(params)
#   if delivery.update
#     redirect "delivery/#{delivery.id}/edit"
#   else
#     redirect "delivery/new"
#   end
# end