class ProjectsController < ApplicationController
  # skip_before_action :login_required, only: [:index, :new, :create, :show, :update, :edit]
  before_action :find_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = current_user.projects
  end

  def show
  end

  def new
    @project = Project.new
    @project.tasks.build()
    @categories = Category.all
  end

  def create
    # byebug
    @project = Project.new(project_params)
    @project.tasks.each do |t|
      t.user = current_user
    end
    if @project.valid?
      @project.status = false
      current_user.projects << @project
      @project.save
      redirect_to @project
    else
      flash[:errors] = @project.errors.full_messages
      redirect_to new_project_path
    end
  end

  def edit
  end

  def update
    @project.assign_attributes(project_params)
    if @project.valid?
      @project.save
      redirect_to @project
    else
      flash[:errors] = @project.errors.full_messages
      redirect_to edit_project_path(@project.id)
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end

  private

  def find_project
    @project = Project.find_by(id:params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :status, :points, tasks_attributes: [:name, :status, :due_date, :priority, :user, :category_id])
  end
end
