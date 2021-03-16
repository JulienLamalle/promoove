class BadgeType < ApplicationRecord
  validates :name, presence: true
end
