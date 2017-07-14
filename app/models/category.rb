class Category < ActiveRecord::Base
  has_many :posts
  has_many :videos
  has_many :wisdoms
end
