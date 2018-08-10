class Task < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :description
  has_many :comments, as: :commentable
end
