class CommentAnswerUpvote < ApplicationRecord
  belongs_to :user
  belongs_to :comment_answer
end
