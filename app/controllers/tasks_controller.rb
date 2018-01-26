class TasksController < ApplicationController
  before_action :find_task, only:[:show,:edit,:update,:destroy]
  def index
    @tasks = current_user.tasks
    @tasks = @tasks.sort_by {|task| task.priority}
  end

  def show
    redirect_to '/404' if @task.blank?
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
    @task.category = Category.find_or_create_by(name: params[:task][:category_attributes][:name])
    if @task.valid?
      @task.complete = false
      @task.save
      redirect_to @task
    else
      flash[:errors] = @task.errors.full_messages
      redirect_to new_task_path
    end
  end

  def edit
    redirect_to '/404' if @task.blank?

    @projects = Project.all
    @categories = Category.all

  end

  def update
    @task.assign_attributes(task_params)
    if @task.valid?
      if @task.complete
        @task.complete_date = Time.now
        exp = current_user.experience + @task.points
        current_user.update_attribute(:experience, exp)
        @task.update_attribute(:points, 0)
        @task.save
        if current_user.next_level?
          current_user.level_up
          current_user.save
        end
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
    params.require(:task).permit(:name, :due_date, :priority, :complete, :project_id, :category_id, :user_id, :points, category_attributes: :name, user_attributes: [])
  end

  def find_task
    @task = Task.find_by(id:params[:id])
  end
end
