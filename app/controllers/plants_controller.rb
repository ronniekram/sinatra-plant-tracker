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
      if params[:content] == ""
        redirect to "/plants/new"
      else
        @tweet = current_user.tweets.build(content: params[:content])
        if @tweet.save
          redirect to "/tweets/#{@tweet.id}"
        else
          redirect to "/tweets/new"
        end
      end
    else
      redirect to '/login'
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