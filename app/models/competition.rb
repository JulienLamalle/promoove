class Competition < ApplicationRecord
  has_many :project_competitions
  has_many :projects, through: :project_competitions

  validates :name, presence: true
  validates :duration, presence: true
end
