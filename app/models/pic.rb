class Pic < ActiveRecord::Base
  belongs_to :gallery

  # has_attached_file :image,
  #                   path: ":rails_root/public/images/:id/:filename",
  #                   url: "/images/:id/:filename"
  #
  # do_not_validate_attachment_file_type :image
  mount_uploader :image, ImageUploader, mount_on: :image_file_name

end
