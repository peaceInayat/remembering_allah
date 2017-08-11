class RemoveCoreArticleFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :core_article, :boolean
  end
end
