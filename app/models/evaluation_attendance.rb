class EvaluationAttendance < ApplicationRecord
  belongs_to :student
  belongs_to :course_evaluation
  belongs_to :attendance_type
end
