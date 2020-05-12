class Wishlist < ActiveRecord::Base
  belongs_to :user
  has_many :plants, through: :user
end