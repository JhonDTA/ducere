# frozen_string_literal: true

# Career model
class Career < ApplicationRecord
  # Belongs to associations ---------------------------------------------------
  belongs_to :status

  # Has many associations -----------------------------------------------------
  has_one :level_career, dependent: :restrict_with_error
  has_one :educative_level, through: :level_career
  has_many :syllabuses, through: :level_career
  has_many :grades, through: :level_career
  has_many :courses, through: :level_career

  # Validations ---------------------------------------------------------------
  validates :code, :name, presence: true
  validates :code, uniqueness: true, length: { minimum: 1, maximum: 16 }
  validates :name, length: { minimum: 1, maximum: 255 }
end
