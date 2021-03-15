class ProjectCompetitionUpvote < ApplicationRecord
  belongs_to :user
  belongs_to :project_competition
end
