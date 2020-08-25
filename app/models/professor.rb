# frozen_string_literal: true

# Professor model
class Professor < ApplicationRecord
  # Belongs to associations ---------------------------------------------------
  belongs_to :user

  # Has many associations -----------------------------------------------------
  has_many :professor_courses, dependent: :restrict_with_error

  # Validations ---------------------------------------------------------------
  validates :enrollment, presence: true
  validates :user_id, :enrollment, uniqueness: true
  validates :enrollment, length: { minimum: 1, maximum: 32 }

  delegate :name, :avatar, to: :user

  def self.collection
    all.includes(:user)
  end
end
