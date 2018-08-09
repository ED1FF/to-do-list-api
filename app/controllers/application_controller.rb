class ApplicationController < ActionController::Base
  include Renderable
  skip_before_action :verify_authenticity_token

  expose :token, -> { request.headers['Authorization'].to_s.split(' ').last }
  expose :current_user, -> { User.find_by_auth_token(token) }
end
