# frozen_string_literal: true

# Professor course model
class ProfessorCourse < ApplicationRecord
  # Belongs to associations ---------------------------------------------------
  belongs_to :professor
  belongs_to :course

  # Validations ---------------------------------------------------------------
end
