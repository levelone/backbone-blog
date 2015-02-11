class Comment < ActiveRecord::Base
  attr_accessible :post_id, :content, :first_name, :last_name

  belongs_to :post
end
