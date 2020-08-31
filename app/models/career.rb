# frozen_string_literal: true

# Career model
class Career < ApplicationRecord
  # Belongs to associations ---------------------------------------------------
  belongs_to :educative_level
  belongs_to :status

  # Has many associations -----------------------------------------------------
  has_many :syllabuses, dependent: :restrict_with_error
  has_many :grades, through: :syllabuses
  has_many :courses, through: :syllabuses

  # Validations ---------------------------------------------------------------
  validates :code, :name, presence: true
  validates :code, uniqueness: { scope: :educative_level_id },
                   length: { minimum: 1, maximum: 16 }
  validates :name, length: { minimum: 1, maximum: 255 }
end
