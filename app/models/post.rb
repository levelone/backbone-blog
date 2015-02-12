class Post < ActiveRecord::Base
  attr_accessible :author_id, :content, :permalink, :teaser, :title, :comments_attributes

  belongs_to :author

  has_many :attachments, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :categories, dependent: :destroy

  has_many :tags, through: :categories

  accepts_nested_attributes_for :comments, allow_destroy: true
  accepts_nested_attributes_for :attachments, allow_destroy: true
  accepts_nested_attributes_for :tags

  # validates_presence_of :title
end
