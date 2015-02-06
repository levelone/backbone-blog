class Post < ActiveRecord::Base
  attr_accessible :content, :permalink, :teaser, :title

  belongs_to :author
  has_many :tags
  has_many :attachments

  validates_presence_of :title
end
