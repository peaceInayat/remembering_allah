class AddTitleKeywordToCoreArticles < ActiveRecord::Migration
  def change
    add_column :core_articles, :title_keyword, :string
  end
end
