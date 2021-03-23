class Language < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :project_languages
  has_many :projects, through: :project_languages
  
  belongs_to :language_media

  validates :name, presence: true
end
