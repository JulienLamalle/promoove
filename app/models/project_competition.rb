class ProjectCompetition < ApplicationRecord
  belongs_to :project
  belongs_to :competition
  has_many :badges
end
