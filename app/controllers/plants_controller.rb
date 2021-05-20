class PlantsController < ApplicationController 

  get '/plants' do 
    if_not_logged_in
    @plants = Plant.all
    erb :'/users/show'
  end 

  get '/plants/new' do 
    if_not_logged_in
    erb :'/plants/new'
  end 

  post '/plants' do
    if_not_logged_in
    plant = current_user.plants.build(params)
      if plant.save
        redirect "/plants/#{plant.id}"
      else
        redirect '/plants/new'
      end
  end 

  get '/plants/:id' do
    if_not_logged_in

    @plant = Plant.find(params[:id])

    if @plant
      erb :'/plants/show'
    else 
      redirect "/plants"
    end 
  end 

  get '/plants/:id/edit' do 
    @plant = Plant.find(params[:id])
    if_not_logged_in
    if_not_owner
    erb :'/plants/edit'
  end 


  patch '/plants/:id' do 
    plant = Plant.find(params[:id])

    if_not_logged_in
    if_not_owner

    plant.update(plant_params(params))
    redirect "/plants/#{plant.id}"
  end

  delete '/plants/:id' do
    plant = Plant.find(params[:id])
    if_not_logged_in
    if_not_owner

    plant.delete
    redirect '/plants'   
  end

  private

  def if_not_owner
    if @plant.user_id != current_user.id || plant.user_id != current_user.id
      redirect '/plants'
    end
  end 

  def plant_params(params) 
    plant_hash = {
      :name => params[:name],
      :light => params[:light],
      :water => params[:water],
      :last_date => params[:last_date]
    }
  end 

end 