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
      erb :'/plants/create_plant'
    else 
      redirect '/login'
    end 
  end 

  post '/plants' do
    if logged_in?
      if params[:content] == ""
        redirect to "/plants/new"
      else
        @plant = current_user.plants.build(content: params[:content])
        if @plant.save
          redirect to "/plants/#{@plant.id}"
        else
          redirect to "/plants/new"
        end
      end
    else
      redirect to '/login'
    end
  end 

  get '/plants/:id' do
    if logged_in?
      @plant = Plant.find_by_id(params[:id])
      erb :'/plants/show_plant'
    else 
      redirect '/login'
    end 
  end 

  get '/plants/:id/edit' do 
    if logged_in?
      @plant = Plant.find(params[:id])
      erb :'/plants/edit_plant'
    else 
      redirect '/login'
    end
  end 

  patch '/plants/:id' do 
    @plant = Plant.find_by_id(params[:id])
    if logged_in?
      if params[:content] == ""
        redirect "/plants/#{@plant.id}/edit"
      else 
        @plant.update(content: params[:content])
        redirect "/plants/#{@plant.id}"
      end 
    else 
        redirect '/login'
    end 
  end 

  delete '/plants/:id' do 
    @plant = Plant.find_by_id(params[:id])
    if logged_in?
      if @plant.user_id == @current_user.id
        @plant.delete
        redirect to '/plants'
      else 
        redirect to '/plants'
      end 
    else  
      redirect '/login'
    end
  end

end 