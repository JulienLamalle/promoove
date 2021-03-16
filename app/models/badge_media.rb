class BadgeMedia < ApplicationRecord
  has_one :badge
  validates :aws_link, presence: true
end
