class AnalyticsController < ApplicationController
  def index
    @tasks = Task.all
    @users = User.all
    @projects = Project.all
    @categories = Category.all
  end
end
