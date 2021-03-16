class ProjectLanguage < ApplicationRecord
  belongs_to :language
  belongs_to :project

  validates :language, presence: true
  validates :project, presence: true
end
