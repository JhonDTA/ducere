# frozen_string_literal: true

# Student course model
class StudentCourse < ApplicationRecord
  belongs_to :student
  belongs_to :course_evaluation

  has_one :course_mark, dependent: :restrict_with_error

  def name
    "#{student.name} #{course_evaluation.name}"
  end
end
