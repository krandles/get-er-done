class DashboardController < ApplicationController
  skip_before_action :login_required, only: :index
  def index
    if !current_user
      redirect_to login_path
    end
    @tasks = Task.all.select { |t| t.user == current_user }.sort_by(&:priority)
    @projects = Project.all.select { |p| p.users.include?(current_user) }
  end

end