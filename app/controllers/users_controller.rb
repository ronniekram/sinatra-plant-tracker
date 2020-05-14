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
      flash[:alert] = "All fields must be filled out."
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
      flash[:alert] = "All fields must be filled out."
      redirect '/login'
    else 
      flash[:alert] = "That didn't work. Please try logging in again."
      redirect '/login'
    end 

  end 

  get '/logout' do
    if logged_in? 
      flash[:alert] = "You've been logged out."
      session.destroy
      redirect '/'
    else
      redirect '/'
    end
  end
   
end 