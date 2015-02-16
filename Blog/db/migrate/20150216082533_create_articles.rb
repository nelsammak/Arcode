class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title, index: true
      t.text :text, index: true

      t.timestamps null: false
    end
  end
end
