# frozen_string_literal: true

# Syllabus model
class Syllabus < ApplicationRecord
  # Belongs to associations ---------------------------------------------------
  belongs_to :career
  belongs_to :status

  # Has many associations -----------------------------------------------------
  has_many :syllabus_grades, dependent: :restrict_with_error

  has_many :grades, through: :syllabus_grades
  has_many :courses, through: :syllabus_grades

  # Validations ---------------------------------------------------------------
  validates :code, :name, :approval_credits, presence: true
  validates :code, uniqueness: true, length: { minimum: 1, maximum: 16 }
  validates :name, length: { minimum: 1, maximum: 255 }
  validates :approval_credits, numericality: true
end
