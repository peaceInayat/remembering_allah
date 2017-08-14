class AddColumnToCoreArticles < ActiveRecord::Migration
  def change
    add_column :core_articles, :short_description, :text
  end
end
