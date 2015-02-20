class Post < ActiveRecord::Base
  attr_accessible :author_id, :tag_id, :content, :permalink, :teaser, :title

  belongs_to :author

  has_many :attachments, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :categories, dependent: :destroy

  has_many :tags, through: :categories

  accepts_nested_attributes_for :comments, allow_destroy: true
  accepts_nested_attributes_for :attachments, allow_destroy: true
  accepts_nested_attributes_for :tags

  before_create :truncate_teaser

  private

  def truncate_teaser
    # self.teaser = self.teaser.split[0..50].join(' ')  # truncate by words
    self.teaser = self.teaser.truncate(50)              # truncate by letters
  end
end
