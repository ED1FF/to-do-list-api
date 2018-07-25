class TasksController < ApplicationController
  def index
    render json: Task.all
  end

  def show
    render json: Task.find(params[:id])
  end

  def create
    task = Task.new(task_params)
    if task.save
      render json: task
    else
      render json: { status: 'Error', message: 'Task not saved' }
    end
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    render json: task
  end

  def update
    task = Task.find(params[:id])
    if task.update_attributes(task_params)
      render json: task
    else
      render json: { status: 'Error', message: 'Task not saved' }
    end
  end

  private

  def task_params
    params[:task].permit(:name, :description, :done)
  end
end
