class Testimonial < ActiveRecord::Base
  # has_attached_file :image, styles: { thumb: "150x150>" }, default_url: "/images/:style/missing.png"
  # validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  mount_uploader :image, ImageUploader, mount_on: :image_file_name
end
