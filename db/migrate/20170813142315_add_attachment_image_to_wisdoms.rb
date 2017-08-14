class AddAttachmentImageToWisdoms < ActiveRecord::Migration
  def self.up
    change_table :wisdoms do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :wisdoms, :image
  end
end
