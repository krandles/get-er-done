class ProjectsController < ApplicationController
  # skip_before_action :login_required, only: [:index, :new, :create, :show, :update, :edit]
  before_action :find_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def show
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.valid?
      @project.status = false
      @project.save
      redirect_to @project
    else
      flash[:errors] = @project.errors.full_messages
      render :new
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
      render :edit
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
    params.require(:project).permit(:name, :status, :points)
  end
end
