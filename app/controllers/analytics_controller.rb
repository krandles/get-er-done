class AnalyticsController < ApplicationController
  def index
    @tasks = Task.all
    @users = User.all
    @admins = User.all.select(&:admin)
    @projects = Project.all
    @categories = Category.all
    @completed_projects = Project.all_completed_projects
    @tasks_on_time = Task.on_time
    @tasks_overdue = Task.overdue
    @tasks_percent_on_time = Task.percent_on_time
  end
end
