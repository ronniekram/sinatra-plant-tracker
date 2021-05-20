class WishlistController < ApplicationController 

  get '/wishlist' do 
    if_not_logged_in

    @wishlist = current_user.wishlist
    erb :'/wishlist/show' 
  end 
  
  get '/wishlist/new' do
    if_not_logged_in

    erb :'/wishlist/new'
  end 
  
  post '/wishlist' do 
    if_not_logged_in

    item = current_user.wishlist.build(item_name: params[:item_name])

    if params[:item_name] !="" && item.save
      redirect '/wishlist'
    else
      redirect '/wishlist/new'  
    end 

  end 
  
  get '/wishlist/:id' do 
    if_not_logged_in

    @item = Wishlist.find(params[:id])

    if @item 
      erb :'/wishlist/show_item'
    else 
      redirect '/wishlist'
    end 
  end
  
  delete '/wishlist/:id' do 
    if_not_logged_in
    if_not_owner

    item = Wishlist.find(params[:id])

    if item
      item.delete
    end

    redirect '/wishlist'
  end

  delete '/wishlist-create/:id' do 
    if_not_logged_in
    if_not_owner

    item = Wishlist.find(params[:id])
    plant = current_user.plants.build(name: params[:name], user_id: params[:user_id])
    plant.name = item.item_name
    plant.user_id = item.user_id

    if item && plant.save
      item.delete
      redirect "/plants/#{plant.id}"
    else 
      redirect '/wishlist'
    end
  end

end 