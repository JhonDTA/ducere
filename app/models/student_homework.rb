# frozen_string_literal: true

# Student homework model
class StudentHomework < ApplicationRecord
  # Belongs to associations ---------------------------------------------------
  belongs_to :course_homework
  belongs_to :student

  # Has many associations -----------------------------------------------------
  has_one :homework_evaluation, dependent: :restrict_with_error

  # Validations ---------------------------------------------------------------

  def name
    "#{course_homework.name} - #{student.name}"
  end
end
