class SyllabusGrade < ApplicationRecord
  belongs_to :career_syllabus
  belongs_to :grade

  def name
    "#{career_syllabus.name} - #{grade.name} grado"
  end
end
