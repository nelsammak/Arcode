class Article < ActiveRecord::Base
 	has_many :comments,  dependent: :destroy
 	belongs_to :user
 	has_many :photos,  dependent: :destroy

 	default_scope -> { order(created_at: :desc) }
  
  	validates :title, presence: true,
                    length: { minimum: 5 }
end
