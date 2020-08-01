# frozen_string_literal: true

# Syllabus model
class Syllabus < ApplicationRecord
  # Belongs to associations ---------------------------------------------------
  belongs_to :status

  # Has many associations -----------------------------------------------------
  has_many :career_syllabuses, dependent: :restrict_with_error

  # Validations ---------------------------------------------------------------
end
