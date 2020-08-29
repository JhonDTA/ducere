# frozen_string_literal: true

# Grade course model
class GradeCourse < ApplicationRecord
  # Belongs to associations ---------------------------------------------------
  belongs_to :syllabus_grade
  belongs_to :course

  # Has many associations -----------------------------------------------------
  has_many :course_evaluations, dependent: :restrict_with_error

  # Validations ---------------------------------------------------------------
  validates :syllabus_grade_id, uniqueness: { scope: :course_id }

  delegate :career, to: :syllabus_grade

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
