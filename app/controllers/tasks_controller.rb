class TasksController < ApplicationController
  before_action :find_task, only:[:show,:edit,:update,:destroy]
  def index
    @tasks = current_user.tasks
    @tasks = @tasks.sort_by {|task| task.priority}
  end

  def show
  end

  def new
    @task = Task.new
    @projects = Project.all
    @categories = Category.all
    @task.build_category
  end

  def create
    @task = Task.new(task_params)
    @task.user = User.find(session[:user_id])
    if @task.valid?
      @task.status = false
      @task.save
      redirect_to @task
    else
      flash[:errors] = @task.errors.full_messages
      redirect_to new_task_path
    end
  end

  def edit
    @projects = Project.all
    @categories = Category.all
  end

  def update
    @task.assign_attributes(task_params)
    if @task.valid?
      if @task.status
        @task.complete_date = Time.now
      end
      @task.save
      redirect_to @task
    else
      flash[:errors] = @task.errors.full_messages
      redirect_to edit_task_path(@task.id)
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:name, :due_date, :priority, :status, :project_id, :category_id, :user_id, category_attributes: :name)
  end

  def find_task
    @task = Task.find_by(id:params[:id])
  end
end
