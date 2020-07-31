# frozen_string_literal: true

# Professor course model
class ProfessorCourse < ApplicationRecord
  belongs_to :professor
  belongs_to :course
end
