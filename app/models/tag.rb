class Tag < ActiveRecord::Base
  attr_accessible :tag_name

  has_many :categories
  has_many :posts, through: :categories
end
