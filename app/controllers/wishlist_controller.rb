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
    if logged_in?
      if params[:item] == ""
        redirect '/wishlist/new'
      else 
        @item = current_user.wishlist.build(item_name: params[:item_name])
        if @item.save
          redirect "/wishlist/#{@item.id}" 
        else 
          redirect '/plants/new'
        end 
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
      if @item.user_id == @current_user.id
        @item.delete
        redirect '/wishlist'
      else 
        redirect '/wishlist'
      end
    else 
      redirect '/login'
    end 
  end

end 