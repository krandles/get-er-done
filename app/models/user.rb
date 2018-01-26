class User < ApplicationRecord
  has_many :user_projects
  has_many :projects, through: :user_projects
  has_many :tasks

  has_secure_password
  validates :user_name, :email, uniqueness: true
  validates :user_name, :email, :first_name, :last_name, :password, :password_confirmation, presence: true

  def next_level?
    self.experience >= self.next_level
  end

  def level_up
    while next_level?
      lvl = self.level + 1
      self.update_attribute(:level, lvl)
      remaining_exp = self.experience - self.next_level
      self.update_attribute(:experience, remaining_exp)
      if self.next_level < 50
        n_lvl = self.next_level *= 1.5
        self.update_attribute(:next_level, n_lvl)
      elsif self.next_level >= 50
        n_lvl = self.next_level *= 1.2
        self.update_attribute(:next_level, n_lvl)
      end
    end
  end

  def add_experience(points)
    self.experience += points
    self.save
  end

  def completed_projects
    self.projects.select {|project| project.complete}.count
  end

  def incompleted_projects
    self.projects.select {|project| !project.complete}.count
  end
end
