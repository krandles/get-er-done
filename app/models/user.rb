class User < ApplicationRecord
  has_many :user_projects
  has_many :projects, through: :user_projects

  has_secure_password
  validates :user_name, :email, uniqueness: true
  validates :user_name, :email, :first_name, :last_name, :password, :password_confirmation, presence: true
end
