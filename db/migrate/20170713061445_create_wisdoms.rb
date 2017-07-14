class CreateWisdoms < ActiveRecord::Migration
  def change
    create_table :wisdoms do |t|
      t.string :title
      t.text :body
      t.integer :user_id
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
