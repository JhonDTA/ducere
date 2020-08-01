# frozen_string_literal: true

# Career syllabus model
class CareerSyllabus < ApplicationRecord
  # Belongs to associations ---------------------------------------------------
  belongs_to :level_career
  belongs_to :syllabus

  # Has many associations -----------------------------------------------------
  has_many :syllabus_grades, dependent: :restrict_with_error

  # Validations ---------------------------------------------------------------
  validates :level_career_id, uniqueness: { scope: :syllabus_id }

  def name
    "#{level_career.name} #{syllabus.code}"
  end
end
