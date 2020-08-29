# frozen_string_literal: true

# Career model
class Career < ApplicationRecord
  # Belongs to associations ---------------------------------------------------
  belongs_to :status
  belongs_to :educative_level

  # Has many associations -----------------------------------------------------
  has_many :syllabuses, through: :career_syllabuses, dependent: :restrict_with_error
  has_many :grades, through: :career_syllabuses
  has_many :courses, through: :career_syllabuses

  # Validations ---------------------------------------------------------------
  validates :code, :name, presence: true
  validates :code, uniqueness: true, length: { minimum: 1, maximum: 16 }
  validates :name, length: { minimum: 1, maximum: 255 }
end
