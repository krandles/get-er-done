class Project < ApplicationRecord
  has_many :user_projects
  has_many :users, through: :user_projects
  has_many :tasks, dependent: :destroy
  accepts_nested_attributes_for :tasks, allow_destroy: true, :reject_if => lambda { |a| a[:name].blank? }
  validates :name, presence: true
  validates :points, inclusion: { in: 0..20 }

  def self.all_completed_projects
    self.all.select {|project| project.complete}.count
  end

  def self.all_incompleted_projects
    self.all.select {|project| !project.complete}.count
  end

end
