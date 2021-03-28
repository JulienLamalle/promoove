class ProjectUpvote < ApplicationRecord
  belongs_to :user
  belongs_to :project, counter_cache: true

  validates :user, uniqueness: {scope: :project}
end
