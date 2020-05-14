class User < ActiveRecord::Base
  has_many :plants
  has_many :wishlist
  has_secure_password
  validates :username, :email, :password, presence: true
  validates :username, format: { with: /[a-zA-Z\d]/, message: "Username can only contain letters and numbers"}
  validates :username, uniqueness: { case_sensitive: false }
  
end