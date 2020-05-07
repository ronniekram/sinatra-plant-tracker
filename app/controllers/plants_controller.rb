class PlantsController < ApplicationController 

  get '/plants' do 
    if logged_in?
      @plants = @current_user.plants
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
    end  
  end 

  get '/plants/:id' do
  end 

  get '/plants/:id/edit' do 
    erb :'/plants/edit_plant'
  end 

  patch '/plants/:id' do 
  end 

  delete '/plants/:id' do 
  end 
end 