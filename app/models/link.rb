class Link < ActiveRecord::Base
  has_many :link_tags
  has_many :tags, through: :link_tags
  has_many :comments, as: :commentable
  accepts_nested_attributes_for :link_tags

  validates :title, presence: true, length: {minimum: 2}
  validates :url, presence: true, length: {minimum: 5}
end
