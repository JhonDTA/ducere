# frozen_string_literal: true

# Syllabus model
class Syllabus < ApplicationRecord
  belongs_to :status

  has_many :career_syllabuses, dependent: :restrict_with_error
end
