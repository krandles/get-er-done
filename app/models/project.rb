class Project < ApplicationRecord
  has_many :user_projects
  has_many :users, through: :user_projects
  has_many :tasks, dependent: :destroy
  accepts_nested_attributes_for :tasks, allow_destroy: true, :reject_if => lambda { |a| a[:name].blank? }
  validates :name, presence: true
  # validates :name, uniqueness: {scope: :user}
  validates :points, numericality: { greater_than: 0 }

  # def destroy_blank_tasks(project_params)
  #   if project_params[:tasks_attributes]
  #     project_params[:tasks_attributes].each do |task_params_array|
  #       t_params = task_params_array[0]
  #       t_params[:_destroy] = 1 if t_params[:name].blank?
  #     end
  #   end
  # end
end
