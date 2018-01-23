class DashboardController < ApplicationController
  def index
    if !current_user
      redirect_to login_path
    end
    @tasks = Task.all.select { |t| t.user == current_user }.sort_by(&:priority)
  end

end