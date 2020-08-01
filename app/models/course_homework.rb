# frozen_string_literal: true

# Course homework model
class CourseHomework < ApplicationRecord
  # Belongs to associations ---------------------------------------------------
  belongs_to :course_evaluation

  # Has many associations -----------------------------------------------------
  has_many :student_homeworks, dependent: :restrict_with_error

  # Validations ---------------------------------------------------------------
  validates :name, presence: true, length: { minimum: 1, maximum: 255 }
end
