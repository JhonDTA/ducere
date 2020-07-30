class CourseEvaluation < ApplicationRecord
  belongs_to :grade_course
  belongs_to :campus_evaluation
  belongs_to :professor
  belongs_to :group

  has_many :student_courses

  def name
    "#{grade_course.name} #{campus_evaluation.name} #{professor.name} #{group.code}"
  end
end
