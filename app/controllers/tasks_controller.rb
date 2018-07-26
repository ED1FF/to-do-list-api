class TasksController < ApplicationController
  def index
    render json: { status: :ok, data: get_all_tasks }
  end

  def show
    render json: { status: :ok, data: get_task }
  end

  def create
    task = new_task
    if task.save
      render json: { status: :created, data: task }
      head :created
    else
      render json: { status: :unprocessable_entity, message: task.errors.full_messages }
      head :unprocessable_entity
    end
  end

  def destroy
    task = get_task
    task.destroy
    render json: { status: :accepted, data: task }
    head :accepted
  end

  def update
    task = get_task
    if task.update_attributes(task_params)
      render json: { status: :accepted, data: task }
      head :accepted
    else
      render json: { status: :unprocessable_entity, message: task.errors.full_messages }
      head :unprocessable_entity
    end
  end

  private

  def task_params
    params[:task].permit(:name, :description, :done)
  end

  def get_all_tasks
    Task.all
  end

  def get_task
    Task.find(params[:id])
  end

  def new_task
    Task.new(task_params)
  end
end
