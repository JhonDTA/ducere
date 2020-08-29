# frozen_string_literal: true

# Career syllabus model
class CareerSyllabus < ApplicationRecord
  # Belongs to associations ---------------------------------------------------
  belongs_to :career
  belongs_to :syllabus

  # Has many associations -----------------------------------------------------
  has_one :educative_level, through: :career

  has_many :syllabus_grades, dependent: :restrict_with_error
  has_many :grade_courses, through: :syllabus_grades
  has_many :grades, through: :syllabus_grades
  has_many :courses, through: :syllabus_grades

  # Validations ---------------------------------------------------------------
  validates :career_id, uniqueness: { scope: :syllabus_id }

  def name
    "#{career.code} #{syllabus.code}"
  end
end
