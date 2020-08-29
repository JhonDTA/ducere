# frozen_string_literal: true

# Course model
class Course < ApplicationRecord
  # Belongs to associations ---------------------------------------------------
  belongs_to :status

  # Has many associations -----------------------------------------------------
  has_many :grade_courses, dependent: :restrict_with_error

  # Validations ---------------------------------------------------------------
  validates :code, :name, :credits, presence: true
  validates :code, uniqueness: true, length: { minimum: 1, maximum: 16 }
  validates :name, length: { minimum: 1, maximum: 255 }
  validates :credits, numericality: true

  delegate :career, to: :grade_courses
end
