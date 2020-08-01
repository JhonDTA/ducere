# frozen_string_literal: true

# Professor course model
class ProfessorCourse < ApplicationRecord
  # Belongs to associations ---------------------------------------------------
  belongs_to :professor
  belongs_to :course

  # Validations ---------------------------------------------------------------
  validates :course_id, uniqueness: { scope: :professor_id }
end
