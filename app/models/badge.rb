class Badge < ApplicationRecord
  belongs_to :badge_type
  belongs_to :project_competition
  belongs_to :badge_media

  validates :badge_type, presence: true
  validates :badge_media, presence: true
end
