class Video < ActiveRecord::Base
  acts_as_votable
  belongs_to :category
  has_many :comments, as: :content,  dependent: :destroy
end
