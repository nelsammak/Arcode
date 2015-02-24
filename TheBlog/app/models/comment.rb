class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :article
  has_many :comment_on_comments,  dependent: :destroy
  mount_uploader :photo, PictureUploader
end
