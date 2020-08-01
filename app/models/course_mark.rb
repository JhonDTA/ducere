# frozen_string_literal: true

# Course mark model
class CourseMark < ApplicationRecord
  # Belongs to associations ---------------------------------------------------
  belongs_to :student_course

  # Validations ---------------------------------------------------------------
  validates :mark, :attendance, presence: true, numericality: true
end
