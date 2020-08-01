# frozen_string_literal: true

# Cycle type model
class CycleType < ApplicationRecord
  # Belongs to associations ---------------------------------------------------
  belongs_to :status

  # Has many associations -----------------------------------------------------
  has_many :academic_cycles, dependent: :restrict_with_error

  # Validations ---------------------------------------------------------------
end
