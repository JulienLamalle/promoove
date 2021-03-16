class ProjectCategory < ApplicationRecord
  belongs_to :category
  belongs_to :project

  validates :category, presence: true
  validates :project, presence: true
end
