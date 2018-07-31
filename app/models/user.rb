class User < ApplicationRecord
  has_secure_password
  has_secure_token :auth_token
  has_and_belongs_to_many :tasks

  validates :password, :password_confirmation, presence: true, confirmation: true, length: { minimum: 8 }, on: :create
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true

  def authenticate!
    regenerate_auth_token
    auth_token
  end
end
