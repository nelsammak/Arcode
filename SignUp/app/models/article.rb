class Article < ActiveRecord::Base
 	has_many :comments,  dependent: :destroy
 	belongs_to :user
 	has_many :photos,  dependent: :destroy
<<<<<<< HEAD
=======
 	has_many :articlecategory, class_name: "ArticleCategory"
	has_many :categories, through: :articlecategory
 	
 	accepts_nested_attributes_for :categories
>>>>>>> 5eb42be2eea0344bb1dd7c13e0387ade6e81709c

 	default_scope -> { order(created_at: :desc) }
  
  	validates :title, presence: true,
                    length: { minimum: 5 }
end
