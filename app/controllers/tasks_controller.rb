class TasksController < ApplicationController
  def index
    render json: tasks, status: :ok
  end

  def show
    render json: matched_task, status: :ok
  end

  def create
    if task.save
      render json: task, status: :created
    else
      render json: { message: task.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    if matched_task.destroy
      head :accepted
    else
      render json: { message: task.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if matched_task.update(task_params)
      render json: matched_task, status: :accepted
    else
      render json: { message: matched_task.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :done)
  end

  def tasks
    @tasks ||= Task.order(created_at: :desc)
  end

  def matched_task
    @matched_task ||= Task.find(params[:id])
  end

  def task
    @task ||= Task.new(task_params)
  end
end
