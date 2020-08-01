# frozen_string_literal: true

# Student course model
class StudentCourse < ApplicationRecord
  # Belongs to associations ---------------------------------------------------
  belongs_to :student
  belongs_to :course_evaluation

  # Has many associations -----------------------------------------------------
  has_one :course_mark, dependent: :restrict_with_error

  # Validations ---------------------------------------------------------------

  def name
    "#{student.name} #{course_evaluation.name}"
  end
end
