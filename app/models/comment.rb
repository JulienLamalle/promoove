class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :project
  has_many :comment_answers
  has_many :comment_upvotes

  validates :user, presence: true
  validates :project, presence: true
end
