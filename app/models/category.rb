class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :project_categories
  has_many :projects, through: :project_categories

  validates :name, presence: true

  private 

  def should_generate_new_friendly_id?
    name_changed?
  end
end
