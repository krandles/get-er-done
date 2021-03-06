class Task < ApplicationRecord
  belongs_to :project
  belongs_to :category
  belongs_to :user

  accepts_nested_attributes_for :category

  validates :name, :due_date, :points, presence: true
  validates :points, inclusion: { in: 0..10 }
  validates :priority, inclusion: { in: 1..5 }
  validates :name, length: { in: 1..100 }

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

  def self.percent_on_time
    ((self.on_time.count.to_f / (self.on_time.count.to_f + self.overdue.count.to_f)) * 100).to_i
  end

end
