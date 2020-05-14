class User < ActiveRecord::Base
  has_many :plants
  has_many :wishlist
  has_secure_password 
  
  validates :username, :email, :password, :presence => true
  validates :username, :email, :uniqueness => {:message => "already exists."}
  validates :password, :length => {:maximum => 15, :message => "must be less than 15 characters."}
end