class Task < ApplicationRecord
  has_many :comments, as: :commentable, dependent: :destroy
  accepts_nested_attributes_for :comments, allow_destroy: true

  validates :name, presence: true
  validates_presence_of :description
end
