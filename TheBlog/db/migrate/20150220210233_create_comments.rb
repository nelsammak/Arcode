class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id, index: true
      t.references :article, index: true
      t.text :body
    end
    add_foreign_key :comments, :users
    add_foreign_key :comments, :articles
  end
end
