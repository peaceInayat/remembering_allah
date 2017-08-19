class CreateMiscs < ActiveRecord::Migration
  def change
    create_table :miscs do |t|
      t.string :code
      t.text :body

      t.timestamps null: false
    end
  end
end
