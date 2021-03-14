class ProjectLanguage < ApplicationRecord
  belongs_to :language
  belongs_to :project
end
