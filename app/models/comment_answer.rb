class CommentAnswer < ApplicationRecord
  belongs_to :user
  belongs_to :comment
  has_many :comment_answer_upvotes
end
