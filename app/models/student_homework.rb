# frozen_string_literal: true

# Student homework model
class StudentHomework < ApplicationRecord
  belongs_to :course_homework
  belongs_to :student

  has_one :homework_evaluation, dependent: :restrict_with_error

  def name
    "#{course_homework.name} - #{student.name}"
  end
end
