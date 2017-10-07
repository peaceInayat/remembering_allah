class AddHighlightToCoreArticles < ActiveRecord::Migration
  def change
    add_column :core_articles, :highlight, :boolean
  end
end
