class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :omniauthable

  has_many :collaborations
  has_many :roles, through: :collaborations
  has_many :projects, through: :collaborations
  has_many :donations
  has_many :comments
  has_many :comment_answers
  has_many :comment_answer_upvotes
  has_many :comment_upvotes
  has_many :project_upvotes

  validates :terms, acceptance: { message: 'doivent être acceptées' }

  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end
end
