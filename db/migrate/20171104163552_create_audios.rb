class CreateAudios < ActiveRecord::Migration
  def change
    create_table :audios do |t|
      t.string :title
      t.text :body
      t.string :url
      t.integer :category_id
      t.integer :rank
      t.boolean :highlight

      t.timestamps null: false
    end
  end
end
