class WishlistController < ApplicationController 
  get '/wishlist' do 
    if logged_in?
      @wishlist = Wishlist.all
      erb :'/wishlist/show' 
    else 
      redirect '/login'
    end 
  end 
  
  get '/wishlist/new' do
    if logged_in?
      erb :'/wishlist/create_item'
    else 
      redirect '/login'
    end  
  end 
  
  post '/wishlist' do 
    @item = current_user.wishlist.build(item_name: params[:item_name])
    if logged_in?
      if params[:item_name] !="" && @item.save
        redirect '/wishlist'
      else
        flash[:alert] = "Item not added. Please try again."
        redirect '/wishlist/new'  
      end 
    else 
      redirect '/login'
    end 
  end 
  
  get '/wishlist/:id' do 
    if logged_in?
      @item = Wishlist.find_by_id(params[:id])
      erb :'/wishlist/show_item'
    else 
      redirect '/login'
    end 
  end
  
  delete '/wishlist/:id' do 
    @item = Wishlist.find_by_id(params[:id])

    if logged_in?
      if @item.user_id == current_user.id
        @item.delete
        redirect '/wishlist'
      else 
        flash[:alert] = "This isn't your wishlist!"
        redirect '/wishlist'
      end
    else 
      redirect '/login'
    end 
  end

  delete '/wishlist-create/:id' do 
    @item = Wishlist.find_by_id(params[:id])
    @plant = current_user.plants.build(name: params[:name], user_id: params[:user_id])
    @plant.name = @item.item_name
    @plant.user_id = @item.user_id

    if logged_in?
      if @item.user_id == current_user.id && @plant.save
        @item.delete
        redirect "/plants/#{@plant.id}"
      else 
        flash[:alert] = "This isn't your wishlist!"
        redirect '/wishlist'
      end
    else 
      redirect '/login'
    end 
  end

end 