class CreateWishlist < ActiveRecord::Migration
  def change
    create_table :wishlist do |t|
      t.string :item_name
      t.integer :user_id
    end 
  end
end
