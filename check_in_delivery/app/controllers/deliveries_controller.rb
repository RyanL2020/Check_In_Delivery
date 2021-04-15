class DeliveriesController < ApplicationController

  # GET: /deliveries
  get "/deliveries" do
    erb :"/deliveries/index.html"
  end

  # GET: /deliveries/new
  get "/deliveries/new" do
    erb :"/deliveries/new.html"
  end

  # POST: /deliveries
  post "/deliveries" do
    redirect "/deliveries"
  end

  # GET: /deliveries/5
  get "/deliveries/:id" do
    erb :"/deliveries/show.html"
  end

  # GET: /deliveries/5/edit
  get "/deliveries/:id/edit" do
    erb :"/deliveries/edit.html"
  end

  # PATCH: /deliveries/5
  patch "/deliveries/:id" do
    redirect "/deliveries/:id"
  end

  # DELETE: /deliveries/5/delete
  delete "/deliveries/:id/delete" do
    redirect "/deliveries"
  end
end
