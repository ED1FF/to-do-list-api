class BaseController < ApiController
  before_action :authenticate_user!

  def authenticate_user!
    unauthorized! unless current_user
  end

  def current_user
    token = request.headers['Authorization'].to_s.split(' ').last
    User.find_by_auth_token(token) if token
  end

  def unauthorized!
    head :unauthorized
  end

  rescue_from ActiveRecord::RecordNotFound do |_e|
    render json: { message: '404 not found' }, status: :not_found
  end

  private

  def render_api(object, status = :ok)
    if object.respond_to?(:errors) && object.errors.present?
      render json: { error: { status: 422, message: object.errors.full_messages.to_sentence,
                              errors: object.errors } }, status: 422
    else
      render json: object, status: status
    end
  end
end
