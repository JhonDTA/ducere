# frozen_string_literal: true

# Student model
class Student < ApplicationRecord
  belongs_to :user

  has_many :student_courses, dependent: :restrict_with_error
  has_many :student_homeworks, dependent: :restrict_with_error

  delegate :name, to: :user
end
