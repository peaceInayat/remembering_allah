class AddCoreArticleToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :core_article, :boolean
  end
end
