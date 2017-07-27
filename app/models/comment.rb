class Comment < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  belongs_to :content, polymorphic: true
end
