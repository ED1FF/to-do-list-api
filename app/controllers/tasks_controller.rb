class TasksController < BaseController
  expose :task
  expose :tasks, -> { Task.order(created_at: :desc) }

  def index
    render_api(tasks)
  end

  def show
    render_api(task)
  end

  def create
    task.save
    render_api(task, :created)
  end

  def destroy
    task.destroy
    render_api(task, :accepted)
  end

  def update
    task.update(task_params)
    render_api(task, :accepted)
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :done)
  end

end
