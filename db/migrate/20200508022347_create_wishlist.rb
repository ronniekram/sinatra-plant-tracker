class CreateWishlist < ActiveRecord::Migration
  def change
    create_table :wishlists do |t|
      t.string :item_name
      t.integer :user_id
    end 
  end
end
