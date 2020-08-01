# frozen_string_literal: true

# Cycle type model
class CycleType < ApplicationRecord
  # Belongs to associations ---------------------------------------------------
  belongs_to :status

  # Has many associations -----------------------------------------------------
  has_many :academic_cycles, dependent: :restrict_with_error

  # Validations ---------------------------------------------------------------
  validates :code, :name, :duration, presence: true
  validates :code, uniqueness: true, length: { minimum: 1, maximum: 16 }
  validates :name, length: { minimum: 1, maximum: 255 }
  validates :duration, numericality: true
end
