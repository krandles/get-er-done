class Task < ApplicationRecord
  belongs_to :project
  belongs_to :category
  belongs_to :user

  validates :name, :due_date, presence: true
  validates :priority, numericality: {greater_than:0}
end
