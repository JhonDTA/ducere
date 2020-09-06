# frozen_string_literal: true

# Grade model
class Grade < ApplicationRecord
  # Belongs to associations ---------------------------------------------------
  belongs_to :status

  # Has many associations -----------------------------------------------------
  has_many :syllabus_grades, dependent: :restrict_with_error
  has_many :courses, through: :syllabus_grades

  has_one :syllabus, through: :syllabus_grades
  has_one :career, through: :syllabus_grades
  has_one :educative_level, through: :syllabus_grades

  # Validations ---------------------------------------------------------------
  validates :name, :sequence, presence: true
  validates :name, uniqueness: { scope: :sequence }
  validates :name, length: { minimum: 1, maximum: 255 }

  default_scope { order(sequence: :asc) }
end
