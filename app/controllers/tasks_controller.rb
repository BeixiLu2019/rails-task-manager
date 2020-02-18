class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  # As a user, I can view all tasks
  def index
    @tasks = Task.all
  end
  # As a user, I can view the details of a task
  def show
  end
  # As a user, I can add a new task
  def new
    @task = Task.new
  end

  def create
    task = Task.create(task_params)
    redirect_to tasks_path
  end
  # As a user, I can edit a task (mark as completed / update title & details)
  def edit
  end

  def update
    @task.update(task_params)
    redirect_to task_path
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

 private
  def task_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    params.require(:task).permit(:title, :details, :completed)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
