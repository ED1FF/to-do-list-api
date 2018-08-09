class UsersController < ApplicationController
  expose :user

  def show
    render json: user, status: :ok
  end

  def create
    return render json: { token: user.auth_token }, status: :created if user.save
    render json: { status: :error, errors: user.errors.messages }, status: :unprocessable_entity
  end

  def update
    return render json: user, status: :accepted if user.update(user_params)
    render json: { status: :error, errors: user.errors.messages }, status: :unprocessable_entity
  end

  private

  def user_params
    params.require(:user).permit(:email, :token, :password, :password_confirmation, addresses_attributes: %i[city address zip _destroy])
  end
end
