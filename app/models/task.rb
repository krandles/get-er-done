class Task < ApplicationRecord
  belongs_to :project
  belongs_to :category
  belongs_to :user

  accepts_nested_attributes_for :category

  validates :name, :due_date, presence: true
  validates :priority, numericality: {greater_than:0}

  def category_name=(name)
    self.category = Category.find_or_create_by(name: name)
  end

  def category_name
    self.category.name
  end

end
