class Project < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

	has_many :collaborations
  has_many :users, through: :collaborations
  has_many :donations
  has_many :project_medias 
  has_many :medias, through: :project_medias
  has_many :comments, dependent: :destroy
  has_many :project_upvotes, dependent: :destroy
  has_many :project_categories
  has_many :categories, through: :project_categories
  has_many :project_languages
  has_many :languages, through: :project_languages

  validates :name, presence: true, length: {minimum: 3}, uniqueness: true
  validates :short_description, length: {maximum: 500, too_long: "La description courte doit comporter %{count} caractères maximum"}
  validates :link_of_github, presence: {message: "Le lien du dépôt du projet doit être renseigné"}

  private 

  def should_generate_new_friendly_id?
    name_changed?
  end
end
