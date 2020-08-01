# frozen_string_literal: true

# Professor model
class Professor < ApplicationRecord
  # Belongs to associations ---------------------------------------------------
  belongs_to :user

  # Has many associations -----------------------------------------------------
  has_many :professor_courses, dependent: :restrict_with_error

  # Validations ---------------------------------------------------------------
  validates :user_id, uniqueness: true

  delegate :name, to: :user

  def self.collection
    all.includes(:user)
  end
end
