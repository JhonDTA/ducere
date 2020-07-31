# frozen_string_literal: true

# Syllabus grades model
class SyllabusGrade < ApplicationRecord
  belongs_to :career_syllabus
  belongs_to :grade

  has_many :grade_courses, dependent: :restrict_with_error

  def name
    "#{career_syllabus.name} - #{grade.name} grado"
  end
end
