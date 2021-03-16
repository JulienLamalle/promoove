class MediaType < ApplicationRecord
  has_many :medias

  validates :name, presence: true
end
