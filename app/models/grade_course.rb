class GradeCourse < ApplicationRecord
  belongs_to :syllabus_grade
  belongs_to :course
end
