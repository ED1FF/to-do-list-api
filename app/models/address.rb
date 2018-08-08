class Address < ApplicationRecord
  belongs_to :user
  validates_presence_of :city, :address, :zip
end
