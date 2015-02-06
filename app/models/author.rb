class Author < ActiveRecord::Base
  attr_accessible :age, :fname, :lname

  has_many :posts
  # validates_presence_of :title
end
