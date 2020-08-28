# frozen_string_literal: true

# Educative level model
class EducativeLevel < ApplicationRecord
  # Belongs to associations ---------------------------------------------------
  belongs_to :status

  # Has many associations -----------------------------------------------------
  has_many :level_careers, dependent: :restrict_with_error
  has_many :careers, through: :level_careers
  has_many :syllabuses, through: :level_careers
  has_many :grades, through: :level_careers
  has_many :courses, through: :level_careers

  # Validations ---------------------------------------------------------------
  validates :code, :name, presence: true
  validates :code, uniqueness: true, length: { minimum: 1, maximum: 16 }
  validates :name, length: { minimum: 1, maximum: 255 }
end
