class Article < ActiveRecord::Base
	has_many :comments,  dependent: :destroy #On Delete Cascade
  	validates :title, presence: true,
              		  length: { minimum: 5 }
end
