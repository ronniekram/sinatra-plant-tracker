class UsersController < ApplicationController 

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'users/show'
  end

  get '/signup' do
    erb :'/users/new_user' 
  end 

  post '/signup' do 
  end 

  get '/login' do
    erb :'/users/login' 
  end 

  post '/login' do 
  end 

  get '/logout' do
    @session.clear 
  end 
end 