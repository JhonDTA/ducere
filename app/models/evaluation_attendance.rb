# frozen_string_literal: true

# Evaluation attendance model
class EvaluationAttendance < ApplicationRecord
  # Belongs to associations ---------------------------------------------------
  belongs_to :course_evaluation
  belongs_to :attendance_type

  # Validations ---------------------------------------------------------------
  validates :student_course_id, uniqueness: { scope: %i[attendance_type_id date] }
end
