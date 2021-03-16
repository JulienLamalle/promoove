class Collaboration < ApplicationRecord
    belongs_to :user
    belongs_to :role
    belongs_to :project

    validates :user, presence: true
    validates :project, presence: true
end
