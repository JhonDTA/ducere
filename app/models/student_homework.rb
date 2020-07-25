class StudentHomework < ApplicationRecord
  belongs_to :course_homework
  belongs_to :student
end
