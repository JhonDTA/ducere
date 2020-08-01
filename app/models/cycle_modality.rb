# frozen_string_literal: true

# Cycle modality model
class CycleModality < ApplicationRecord
  # Belongs to associations ---------------------------------------------------
  belongs_to :academic_cycle
  belongs_to :modality

  # Has many associations -----------------------------------------------------
  has_many :cycle_turns, dependent: :restrict_with_error

  # Validations ---------------------------------------------------------------
  validates :academic_cycle_id, uniqueness: { scope: :modality_id }

  def name
    "#{academic_cycle.name} - #{modality.name}"
  end
end
