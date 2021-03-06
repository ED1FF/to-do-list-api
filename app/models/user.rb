class User < ApplicationRecord
  has_secure_password
  has_secure_token :auth_token
  has_many :addresses, dependent: :destroy
  has_and_belongs_to_many :tasks, dependent: :delete_all
  accepts_nested_attributes_for :addresses, allow_destroy: true

  validates :password, :password_confirmation, presence: true, confirmation: true, length: { minimum: 8 }, on: :create
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true, presence: true

  def authenticate!
    regenerate_auth_token
    auth_token
  end
end
