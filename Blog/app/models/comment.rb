class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :article
  mount_uploader :photo, PictureUploader
end
