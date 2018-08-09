class ApplicationController < ActionController::Base
  include RenderTable
  skip_before_action :verify_authenticity_token, only: :create
end
