class Language < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :project_languages
  has_many :projects, through: :project_languages

  validates :name, :picture_url, presence: true

  private 

  def should_generate_new_friendly_id?
    name_changed?
  end
end
