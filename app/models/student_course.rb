class StudentCourse < ApplicationRecord
  belongs_to :student
  belongs_to :course_evaluation

  def name
    "#{student.name} #{course_evaluation.name}"
  end
end
