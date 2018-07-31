class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  private

  def authenticate_user!
    unauthorized! unless current_user
  end

  def current_user
    token = request.headers['Authorization'].to_s.split(' ').last
    User.find_by_token(token) if token
  end

  def unauthorized!
    head :unauthorized
  end
end
