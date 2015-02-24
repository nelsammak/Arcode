class CreateCommentOnComments < ActiveRecord::Migration
  def change
    create_table :comment_on_comments do |t|
      t.text :field
      t.integer :user_id, index: true
      t.references :comment, index: true
  end
  add_foreign_key :comment_on_comments, :users
    add_foreign_key :comment_on_comments, :comments

  end
end
