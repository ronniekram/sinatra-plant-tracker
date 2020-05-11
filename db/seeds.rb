user1 = User.create(:username => "grampa", :email => "grampa@grampa.com", :password => "grampa")

user2 = User.create(:username => "ronnie", :email => "ronnie@grampa.com", :password => "ronnie")


plant1 = Plant.create(:name => "snake plant", :light => "low", :water => "when soil is dry", :last_date => "5/3/2020", :user_id => "1")

plant2 = Plant.create(:name => "monstera", :light => "bright, filtered", :water => "when top inch of soil is dry", :last_date => "5/5/2020", :user_id => "1")

plant3 = Plant.create(:name => "pothos", :light => "low to medium, filtered", :water => "when top inch of soil is dry", :last_date => "5/3/2020", :user_id => "2")

plant4 = Plant.create(:name => "spider", :light => "bright filtered", :water => "keep soil moist, but not wet", :last_date => "5/7/2020", :user_id => "2")


wishlist1 = Wishlist.create(:item_name => "pink princess philo", :user_id => "1")
wishlist2 = Wishlist.create(:item_name => "thai constellation monstera", :user_id => "1")
wishlist3 = Wishlist.create(:item_name => "curly spider", :user_id => "1")
wishlist4 = Wishlist.create(:item_name => "ufo plant", :user_id => "2")
wishlist5 = Wishlist.create(:item_name => "money tree", :user_id => "2")
wishlist6 = Wishlist.create(:item_name => "bonsai", :user_id => "2")
