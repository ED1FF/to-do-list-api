class UsersController < ApplicationController
  expose :user

  def show
    render_api(user)
  end

  def create
    return render json: { token: user.auth_token }, status: :created if user.save
    render json: { errors: user.errors.messages }, status: :unprocessable_entity
  end

  def update
    user.update(user_params)
    render_api(user, :accepted)
  end

  private

  def user_params
    params.require(:user).permit(:email, :token, :password, :password_confirmation, addresses_attributes: %i[id city address zip _destroy])
  end
end
