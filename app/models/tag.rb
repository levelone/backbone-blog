class Tag < ActiveRecord::Base
  attr_accessible :name

  has_many :categories
  has_many :posts, through: :categories
end
