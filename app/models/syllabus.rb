# frozen_string_literal: true

# Syllabus model
class Syllabus < ApplicationRecord
  # Belongs to associations ---------------------------------------------------
  belongs_to :career
  belongs_to :status

  # Has many associations -----------------------------------------------------
  has_one :educative_level, through: :career

  has_many :syllabus_grades, dependent: :restrict_with_error
  has_many :grades, through: :syllabus_grades
  has_many :courses, through: :syllabus_grades

  # Validations ---------------------------------------------------------------
  validates :code, :name, :approval_credits, presence: true
  validates :code, uniqueness: { scope: :career_id },
                   length: { minimum: 1, maximum: 16 }
  validates :name, length: { minimum: 1, maximum: 255 }
  validates :approval_credits, numericality: true

  # @param [Grade] grade
  #
  def courses_by_grade(grade)
    name = grade.name
    Course.joins(grade_courses: [:grade, { syllabus_grade: :syllabus }])
          .where(syllabuses: { code: code }, grades: { name: name })
  end
end
