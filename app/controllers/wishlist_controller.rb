class WishlistController < ApplicationController 

  get '/wishlist' do 

    if logged_in?
      @wishlist = current_user.wishlist
      erb :'/wishlist/show' 
    else 
      redirect '/login'
    end 

  end 
  
  get '/wishlist/new' do

    if logged_in?
      erb :'/wishlist/new'
    else 
      redirect '/login'
    end  

  end 
  
  post '/wishlist' do 

    item = current_user.wishlist.build(item_name: params[:item_name])

    if logged_in?
      if params[:item_name] !="" && item.save
        redirect '/wishlist'
      else
        redirect '/wishlist/new'  
      end 
    else 
      redirect '/login'
    end 

  end 
  
  get '/wishlist/:id' do 

    if logged_in?
      @item = current_user.wishlist.find_by_id(params[:id])
      if @item 
        erb :'/wishlist/show_item'
      else 
        redirect '/wishlist'
      end 
    else 
      redirect '/login'
    end 

  end
  
  delete '/wishlist/:id' do 

    item = current_user.wishlist.find_by_id(params[:id])

    if logged_in?
      if item
        item.delete
        redirect '/wishlist'
      else 
        redirect '/wishlist'
      end
    else 
      redirect '/login'
    end 

  end

  delete '/wishlist-create/:id' do 
    
    item = current_user.wishlist.find_by_id(params[:id])
    plant = current_user.plants.build(name: params[:name], user_id: params[:user_id])
    plant.name = item.item_name
    plant.user_id = item.user_id

    if logged_in?
      if item && plant.save
        item.delete
        redirect "/plants/#{plant.id}"
      else 
        redirect '/wishlist'
      end
    else 
      redirect '/login'
    end 
  end

end 