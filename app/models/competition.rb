class Competition < ApplicationRecord
  has_many :project_competitions
  has_many :projects, through: :project_competitions
end
