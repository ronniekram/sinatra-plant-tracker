class UsersController < ApplicationController 
  get '/signup' do
    if logged_in?
      redirect '/plants'
    else 
      erb :'/users/new_user' 
    end 
  end 

  post '/signup' do 
    @user = User.new(params)
  
    if @user.save 
      session[:user_id] = @user.id 
      redirect '/plants'
    else  
      @errors = @user.errors.full_messages.uniq
      erb :'/users/new_user'
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
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect '/plants'
    else 
      if @user == nil
        @error = "Invalid username/password."
        erb :'/users/login'
      end
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