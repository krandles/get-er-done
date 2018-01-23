class Project < ApplicationRecord
  has_many :user_projects
  has_many :users, through: :user_projects
  has_many :tasks
  
  validates :name, presence:true
  validates :name, uniqueness:true
  validates :points, numericality:{greater_than:0}
end
