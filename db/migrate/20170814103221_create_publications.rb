class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.string :title
      t.text :body
      t.string :event_date
      t.integer :rank

      t.timestamps null: false
    end
  end
end
