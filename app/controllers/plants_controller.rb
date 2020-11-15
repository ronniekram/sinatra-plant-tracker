class PlantsController < ApplicationController 

  get '/plants' do 

    if logged_in?
      @plants = Plant.all
      erb :'/users/show'
    else 
      redirect '/login'
    end 

  end 

  get '/plants/new' do 

    if logged_in?
      erb :'/plants/new'
    else 
      redirect '/login'
    end 

  end 

  post '/plants' do

    if logged_in?
      plant = current_user.plants.build(params)
        if plant.save
          redirect "/plants/#{plant.id}"
        else
          redirect '/plants/new'
        end
    else
      redirect '/login'
    end

  end 

  get '/plants/:id' do

    if logged_in?
      @plant = current_user.plants.find_by_id(params[:id])

      if @plant
        erb :'/plants/show'
      else 
        redirect "/plants"
      end 

    else 
      redirect '/login'
    end 

  end 

  get '/plants/:id/edit' do 

    if logged_in?
      @plant = current_user.plants.find_by_id(params[:id])

      if @plant.user_id == current_user.id
        erb :'/plants/edit'
      else  
        redirect '/plants'
      end

    else 
      redirect '/login'
    end

  end 


  patch '/plants/:id' do 

    plant = current_user.plants.find_by_id(params[:id])
    
    if logged_in?
      if plant.user_id == current_user.id
        plant.update(plant_params(params))
        redirect "/plants/#{plant.id}"
      else 
        redirect '/plants'
      end 
    else 
        redirect '/login'
    end 

  end

  delete '/plants/:id' do

    plant = current_user.plants.find_by_id(params[:id])

    if logged_in?
      if plant.user_id == current_user.id
        plant.delete
        redirect '/plants'
      else 
        redirect '/plants'
      end 
    else  
      redirect '/login'
    end
    
  end

  private

  def plant_params(params) 
    plant_hash = {
      :name => params[:name],
      :light => params[:light],
      :water => params[:water],
      :last_date => params[:last_date]
    }
  end 

end 