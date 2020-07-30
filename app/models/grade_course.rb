class GradeCourse < ApplicationRecord
  belongs_to :syllabus_grade
  belongs_to :course

  def name
    "#{syllabus_grade.name} - #{course.name}"
  end
end
