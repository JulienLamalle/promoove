class ProjectCompetitionUpvote < ApplicationRecord
  belongs_to :user
  belongs_to :project_competition

  validates :user, presence: true
  validates :project_competition, presence: true
  validates :user, uniqueness: { scope: :project_competition}
end
