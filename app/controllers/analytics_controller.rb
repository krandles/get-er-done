class AnalyticsController < ApplicationController
  def index
    @tasks = Task.all
    @users = User.all
    @projects = Project.all
    @categories = Category.all
    @completed_projects = Project.all_completed_projects
  end
end
