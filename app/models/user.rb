class User < ActiveRecord::Base
  has_many :plants
  has_many :wishlist

  has_secure_password
  
end