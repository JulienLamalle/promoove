class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :project
  has_many :comment_answers
  has_many :comment_upvotes

  validates :user, presence: true
  validates :project, presence: true

  def is_liked
    if self.comment_upvotes.find_by(user: User.last).present?
      return true
    else 
      return false
    end
  end
end
