class Project < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

	has_many :collaborations
  has_many :users, through: :collaborations
  has_many :donations
  has_many :project_medias
  has_many :medias, through: :project_medias
	has_many :project_competitions
  has_many :competitions, through: :project_competitions
  has_many :comments

  private 

  def should_generate_new_friendly_id?
    name_changed?
  end
end
