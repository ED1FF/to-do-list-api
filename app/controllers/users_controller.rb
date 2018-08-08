class UsersController < ApplicationController
  expose :user

  def create
    return render json: { token: user.auth_token }, status: :created if user.update(user_params)
    render json: { status: :error, errors: user.errors.messages }, status: :unprocessable_entity
  end

  private

  def user_params
    params.require(:user).permit(:email, :token, :password, :password_confirmation, address_attributes: {})
  end
end
