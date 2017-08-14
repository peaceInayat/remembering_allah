class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :title
      t.string :body
      t.integer :rank
      t.string :event_date

      t.timestamps null: false
    end
  end
end
