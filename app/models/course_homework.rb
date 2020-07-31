# frozen_string_literal: true

# Course homework model
class CourseHomework < ApplicationRecord
  belongs_to :course_evaluation

  has_many :student_homeworks, dependent: :restrict_with_error
end
