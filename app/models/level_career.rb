# frozen_string_literal: true

# Level career model
class LevelCareer < ApplicationRecord
  # Belongs to associations ---------------------------------------------------
  belongs_to :educative_level
  belongs_to :career

  # Has many associations -----------------------------------------------------
  has_many :career_syllabuses, dependent: :restrict_with_error

  # Validations ---------------------------------------------------------------
  validates :career_id, uniqueness: { scope: :educative_level }

  def name
    "#{educative_level.name} #{career.name}"
  end
end
