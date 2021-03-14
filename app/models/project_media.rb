class ProjectMedia < ApplicationRecord
  belongs_to :media
  belongs_to :project
end
