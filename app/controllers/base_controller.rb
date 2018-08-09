class BaseController < ApiController
  include Renderable
  before_action :authenticate_user!

  expose :token, -> { request.headers['Authorization'].to_s.split(' ').last }
  expose :current_user, -> { User.find_by_auth_token(token) }

  rescue_from ActiveRecord::RecordNotFound do |_e|
    render json: { message: '404 not found' }, status: :not_found
  end

  private

  def authenticate_user!
    unauthorized! unless current_user
  end

  def unauthorized!
    head :unauthorized
  end
end
