class Media < ApplicationRecord
  has_many :project_medias
  has_many :projects, through: :project_medias
  belongs_to :media_type

  validates :aws_link, presence: true
  validates :media_type, presence: true
end
