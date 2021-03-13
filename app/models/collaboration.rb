class Collaboration < ApplicationRecord
    belongs_to :user
    belongs_to :role
    belongs_to :project
end
