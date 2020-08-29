# frozen_string_literal: true

# Career syllabus model
class CareerSyllabus < ApplicationRecord
  # Belongs to associations ---------------------------------------------------
  belongs_to :career
  belongs_to :syllabus

  # Has many associations -----------------------------------------------------
  has_many :educative_levels, through: :level_career
  has_one :career, through: :level_career

  has_many :syllabus_grades, dependent: :restrict_with_error
  has_many :grade_courses, through: :syllabus_grades
  has_many :grades, through: :syllabus_grades
  has_many :courses, through: :syllabus_grades

  # Validations ---------------------------------------------------------------
  validates :level_career_id, uniqueness: { scope: :syllabus_id }

  def name
    "#{level_career.name} #{syllabus.code}"
  end
end
