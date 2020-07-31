class GradeCourse < ApplicationRecord
  belongs_to :syllabus_grade
  belongs_to :course

  def name
    "#{syllabus_grade.name} - #{course.name}"
  end

  def self.collection
    all.includes([{ syllabus_grade: [
                   { career_syllabus: [
                     { level_career: %i[educative_level career] },
                     :syllabus
                   ] }, :grade
                 ] }, :course])
  end
end
