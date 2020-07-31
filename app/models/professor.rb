# frozen_string_literal: true

# Professor model
class Professor < ApplicationRecord
  belongs_to :user

  has_many :professor_courses, dependent: :restrict_with_error

  validates :user_id, uniqueness: true

  delegate :name, to: :user

  def self.collection
    all.includes(:user)
  end
end
