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
    t = @project.tasks.build
    t.build_category(name: "")
    t = @project.tasks.build
    t.build_category(name: "")
    t = @project.tasks.build
    t.build_category(name: "")
    @categories = Category.all
  end

  def create
    @project = Project.new(project_params)
    @project.tasks.each_with_index do |t, index|
      t.user = current_user
      t.category = Category.find_or_create_by(name: params[:project][:tasks_attributes]["#{index}"][:category_attributes][:name])
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
    params.require(:project).permit(:name, :status, :points, tasks_attributes: [:name, :status, :due_date, :priority, :user, category_attributes: :name])
  end
end
