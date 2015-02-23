class Attachment < ActiveRecord::Base
  attr_accessible :post_id, :title, :file_type, :description, :image
  belongs_to :post
  mount_uploader :image, ImageUploader
end
