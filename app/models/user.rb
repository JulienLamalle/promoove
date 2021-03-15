class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  has_many :collaborations
  has_many :roles, through: :collaborations
  has_many :projects, through: :collaborations
  has_many :donations
  has_many :project_competition_upvotes
  has_many :comments
  has_many :comment_answers
  has_many :comment_answer_upvotes
  has_many :comment_upvotes
end
