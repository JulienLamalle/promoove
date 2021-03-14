class Language < ApplicationRecord
  has_many :project_languages
  has_many :projects, through: :project_languages
  belongs_to :language_media
end
