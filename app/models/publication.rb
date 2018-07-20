class Publication < ActiveRecord::Base

  # has_attached_file :image, styles: { thumb: "1000x500>" }, default_url: "/images/:style/missing.png"
  # validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  # validates_attachment_size :image, :less_than => 0.5.megabytes, :unless => Proc.new {|m| m[:image].nil?}
  mount_uploader :image, ImageUploader, mount_on: :image_file_name

  has_attached_file :document, dependent: :destroy
  # validates_attachment :document, :content_type => { :content_type => %w(application/pdf) }

end
