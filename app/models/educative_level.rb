# frozen_string_literal: true

# Educative level model
class EducativeLevel < ApplicationRecord
  # Belongs to associations ---------------------------------------------------
  belongs_to :status

  # Has many associations -----------------------------------------------------
  has_many :careers, dependent: :restrict_with_error
  has_many :syllabuses, through: :careers
  has_many :grades, through: :careers
  has_many :courses, through: :careers

  # Validations ---------------------------------------------------------------
  validates :code, :name, presence: true
  validates :code, uniqueness: true, length: { minimum: 1, maximum: 16 }
  validates :name, length: { minimum: 1, maximum: 255 }
end
