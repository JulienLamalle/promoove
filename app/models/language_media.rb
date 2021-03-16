class LanguageMedia < ApplicationRecord
  has_one :language

  validates :aws_link, presence: true
end
