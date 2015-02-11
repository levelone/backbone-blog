class Author < ActiveRecord::Base
  attr_accessible :age, :first_name, :last_name

  has_many :posts, dependent: :destroy
end
