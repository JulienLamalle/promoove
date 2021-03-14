class Media < ApplicationRecord
  has_many :project_medias
  has_many :projects, through: :project_medias
end
