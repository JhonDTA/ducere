class CourseEvaluation < ApplicationRecord
  belongs_to :grade_course
  belongs_to :campus_evaluation
  belongs_to :professor
  belongs_to :group
end
