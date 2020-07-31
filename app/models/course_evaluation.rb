# frozen_string_literal: true

# Course evaluation model
class CourseEvaluation < ApplicationRecord
  belongs_to :grade_course
  belongs_to :campus_evaluation
  belongs_to :professor
  belongs_to :group

  has_many :student_courses, dependent: :restrict_with_error
  has_many :course_homeworks, dependent: :restrict_with_error

  def name
    "#{grade_course.name} #{campus_evaluation.name} #{professor.name} #{group.code}"
  end
end
