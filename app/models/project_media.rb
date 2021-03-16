class ProjectMedia < ApplicationRecord
  belongs_to :media
  belongs_to :project

  validates :media, presence: true
  validates :project, presence: true
end
