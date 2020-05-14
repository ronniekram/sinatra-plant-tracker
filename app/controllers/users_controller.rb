class UsersController < ApplicationController 
  get '/signup' do
    if logged_in?
      redirect '/plants'
    else 
      erb :'/users/new_user' 
    end 
  end 

  post '/signup' do
    user = User.new(params)
    if params.any? == ""
      redirect '/signup'
    elsif user.save
      session[:user_id] = user.id
      redirect to '/plants'
    else
      if user.username
        redirect '/signup'
      elsif user.email
        redirect '/signup'
      end
    end
  end

  get '/login' do 
    if !logged_in?
      erb :'/users/login'
    else  
      redirect '/plants'
    end 
  end

  post '/login' do 
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect '/plants'
    elsif params.any? == ""
      redirect '/login'
    else 
      redirect '/login'
    end 

  end 

  get '/logout' do
    if logged_in? 
      session.destroy
      redirect '/'
    else
      redirect '/'
    end
  end
   
end 