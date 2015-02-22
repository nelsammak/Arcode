class Article < ActiveRecord::Base
 	has_many :comments,  dependent: :destroy
 	belongs_to :user
 	has_many :photos,  dependent: :destroy
 	has_many :articlecategory, class_name: "ArticleCategory"
	has_many :categories, through: :articlecategory
 	
 	accepts_nested_attributes_for :categories

 	default_scope -> { order(created_at: :desc) }
  
  	validates :title, presence: true,
                    length: { minimum: 5 }
end
