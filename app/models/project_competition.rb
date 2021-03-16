class ProjectCompetition < ApplicationRecord
  belongs_to :project
  belongs_to :competition
  has_many :badges

  validates :project, presence: true
  validates :competition, presence: true
end
