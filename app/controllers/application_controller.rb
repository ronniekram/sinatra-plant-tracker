require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "plant_secret"
  end

  get '/' do 
    erb :index
  end 

  helpers do

    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def if_not_logged_in
      if !logged_in?
        redirect '/login'
      end
    end 
  
    def if_not_owner
      if self.user_id != current_user.id
        if self.instance_of? Plant
          redirect '/plants'
        elsif self.instance_of? Wishlist
          redirect '/wishlist'
        end
      end
    end 

  end

end
