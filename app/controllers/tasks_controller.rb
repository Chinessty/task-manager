class TasksController < ApplicationController
  
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new # needed to instantiate the form_for
  end

  def create
    @task = Task.new(params[task_params])
    @task.save
    # Will raise ActiveModel::ForbiddenAttributesError
  end

  private

  def task_params
    params.require(:task).permit(:tasks, :completed, :boolean, default: false)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    # Will raise ActiveModel::ForbiddenAttributesError
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
  end
end
