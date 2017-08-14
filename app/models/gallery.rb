class Gallery < ActiveRecord::Base
  has_many :pics, dependent: :destroy
end
