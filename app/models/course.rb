# frozen_string_literal: true

# Course model
class Course < ApplicationRecord
  # Belongs to associations ---------------------------------------------------
  belongs_to :status

  # Has many associations -----------------------------------------------------
  has_many :grade_courses, dependent: :restrict_with_error

  has_one :grade, through: :grade_courses
  has_one :syllabus, through: :grade_courses
  has_one :career, through: :grade_courses
  has_one :educative_level, through: :grade_courses

  # Validations ---------------------------------------------------------------
  validates :code, :name, :credits, presence: true
  validates :code, uniqueness: true, length: { minimum: 1, maximum: 16 }
  validates :name, length: { minimum: 1, maximum: 255 }
  validates :credits, numericality: true

  delegate :career, to: :grade_courses
end
