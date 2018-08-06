class BulkTasksController < BaseController
  expose :tasks, -> { current_user.tasks.where(id: params[:id]) }

  def destroy
    tasks.destroy_all
    render_api(tasks, :accepted)
  end

  def update
    tasks.update_all(update_params.to_hash)
    render_api(tasks, :accepted)
  end

  private

  def update_params
    params.permit(:done)
  end
end
