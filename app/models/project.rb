class Project < ApplicationRecord
    has_many :collaborations
    has_many :users, through: :collaborations
    has_many :donations
    has_many :project_medias
    has_many :medias, through: :project_medias
end
