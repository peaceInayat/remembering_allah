class CreateCoreArticles < ActiveRecord::Migration
  def change
    create_table :core_articles do |t|
      t.string :title
      t.text :body
      t.integer :user_id
      t.integer :rank

      t.timestamps null: false
    end
  end
end
