class Category < ActiveRecord::Base
	has_many :articlecategory, class_name: "ArticleCategory"
	has_many :articles, through: :articlecategory
	validates :category, presence: true
end
