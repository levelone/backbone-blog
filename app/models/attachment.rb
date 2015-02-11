class Attachment < ActiveRecord::Base
  attr_accessible :post_id, :title, :file_type, :description

  belongs_to :post
end
