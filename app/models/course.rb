# frozen_string_literal: true

# Course model
class Course < ApplicationRecord
  belongs_to :status

  has_many :grade_courses, dependent: :restrict_with_error
end
