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
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      redirect '/signup'
    else
      if user.save
        session[:user_id] = user.id
        redirect '/plants'
      else
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
    else 
      flash[:alert] = "That didn't work. Please try logging in again."
      redirect '/'
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

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :"/users/#{@user.slug}"
  end
   
end 