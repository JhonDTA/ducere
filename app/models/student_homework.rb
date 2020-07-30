class StudentHomework < ApplicationRecord
  belongs_to :course_homework
  belongs_to :student

  def name
    "#{course_homework.name} - #{student.name}"
  end
end
