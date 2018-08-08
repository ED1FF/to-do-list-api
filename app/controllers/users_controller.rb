class UsersController < ApplicationController
  expose :user

  def create
    return render json: { token: user.auth_token }, status: :created if user.save
    render json: { status: :error, errors: user.errors.messages }, status: :unprocessable_entity
  end

  private

  def user_params
    params.require(:user).permit(:email, :token, :password, :password_confirmation, addresses_attributes: %i[city address zip])
  end
end
