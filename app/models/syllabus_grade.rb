# frozen_string_literal: true

# Syllabus grades model
class SyllabusGrade < ApplicationRecord
  # Belongs to associations ---------------------------------------------------
  belongs_to :syllabus
  belongs_to :grade

  # Has many associations -----------------------------------------------------
  has_one :career, through: :syllabus
  has_one :educative_level, through: :syllabus

  has_many :grade_courses, dependent: :restrict_with_error
  has_many :courses, through: :grade_courses

  # Validations ---------------------------------------------------------------
  validates :grade_id, uniqueness: { scope: :syllabus_id }

  def name
    "#{syllabus.name} - #{grade.name} grado"
  end
end
