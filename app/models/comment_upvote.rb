class CommentUpvote < ApplicationRecord
  belongs_to :user
  belongs_to :comment

  validates :user, presence: true
  validates :comment, presence: true
  validates :user, uniqueness: true
end
