class CreateCategories < ActiveRecord::Migration
  def change
  	create_table :categories do |t|
  		t.string :category
  		t.timestamps
  	end
  	create_join_table :categories, :articles
  end
end
