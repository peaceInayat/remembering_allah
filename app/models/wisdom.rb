class Wisdom < ActiveRecord::Base
  acts_as_votable
  belongs_to :user
  belongs_to :category

  has_attached_file :image, styles: { thumb: "500x500>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

end
