# frozen_string_literal: true

# Syllabus model
class Syllabus < ApplicationRecord
  # Belongs to associations ---------------------------------------------------
  belongs_to :status

  # Has many associations -----------------------------------------------------
  has_many :career_syllabuses, dependent: :restrict_with_error

  has_many :educative_levels, through: :career_syllabuses
  has_many :careers, through: :career_syllabuses

  has_many :grades, through: :career_syllabuses
  has_many :courses, through: :career_syllabuses

  # Validations ---------------------------------------------------------------
  validates :code, :name, :approval_credits, presence: true
  validates :code, uniqueness: true, length: { minimum: 1, maximum: 16 }
  validates :name, length: { minimum: 1, maximum: 255 }
  validates :approval_credits, numericality: true
end
