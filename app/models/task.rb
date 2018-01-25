class Task < ApplicationRecord
  belongs_to :project
  belongs_to :category
  belongs_to :user

  accepts_nested_attributes_for :category

  validates :name, :due_date, :points, presence: true
  validates :points, inclusion: { in: 0..10 }
  validates :priority, inclusion: { in: 1..5 }

  def category_name=(name)
    self.category = Category.find_or_create_by(name: name)
  end

  def category_name
    self.category.name
  end

  def self.on_time
    self.all.select {|task| task.complete && task.due_date >= task.complete_date}
  end

  def self.overdue
    self.all.select {|task| task.complete && task.due_date < task.complete_date}
  end

end
