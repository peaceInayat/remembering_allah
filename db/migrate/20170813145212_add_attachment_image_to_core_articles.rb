class AddAttachmentImageToCoreArticles < ActiveRecord::Migration
  def self.up
    change_table :core_articles do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :core_articles, :image
  end
end
