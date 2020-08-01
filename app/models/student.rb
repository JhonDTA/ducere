# frozen_string_literal: true

# Student model
class Student < ApplicationRecord
  # Belongs to associations ---------------------------------------------------
  belongs_to :user
  # Has many associations -----------------------------------------------------
  has_many :student_courses, dependent: :restrict_with_error
  has_many :student_homeworks, dependent: :restrict_with_error

  # Validations ---------------------------------------------------------------

  delegate :name, to: :user
end
