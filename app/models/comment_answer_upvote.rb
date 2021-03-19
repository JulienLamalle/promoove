class CommentAnswerUpvote < ApplicationRecord
  belongs_to :user
  belongs_to :comment_answer

  validates :user, presence: true
  validates :comment_answer, presence: true
  validates :user, uniqueness: true
end
