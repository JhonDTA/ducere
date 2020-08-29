# frozen_string_literal: true

# Syllabus grades model
class SyllabusGrade < ApplicationRecord
  # Belongs to associations ---------------------------------------------------
  belongs_to :career_syllabus
  belongs_to :grade

  # Has many associations -----------------------------------------------------
  has_many :grade_courses, dependent: :restrict_with_error
  has_many :courses, through: :grade_courses

  # Validations ---------------------------------------------------------------
  validates :career_syllabus_id, uniqueness: { scope: :grade_id }

  delegate :career, to: :career_syllabus

  def name
    "#{career_syllabus.name} - #{grade.name} grado"
  end
end
