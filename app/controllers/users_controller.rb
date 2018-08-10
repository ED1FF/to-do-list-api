class UsersController < ApplicationController
  expose :user

  def show
    render_api(current_user)
  end

  def create
    user.save
    render_api({token: user.auth_token}.compact, :created)
  end

  def update
    current_user.update(user_params)
    render_api(current_user, :accepted)
  end

  private

  def user_params
    params.require(:user).permit(:email, :token, :password, :password_confirmation, addresses_attributes: %i[id city address zip _destroy])
  end
end
