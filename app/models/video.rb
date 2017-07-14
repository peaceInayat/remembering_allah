class Video < ActiveRecord::Base
  acts_as_votable
  belongs_to :category
  belongs_to :user
  has_many :comments, as: :content,  dependent: :destroy
end
