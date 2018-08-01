class SessionsController < ApplicationController
  expose(:user) { User.find_by_email(params[:email]) }

  def create
    return render json: { token: user.authenticate! }, status: :ok if user && user.authenticate(params[:password])
    render json: { message: 'Invalid email or password.' }, status: :unprocessable_entity
  end
end
