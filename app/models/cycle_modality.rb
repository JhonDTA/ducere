# frozen_string_literal: true

# Cycle modality model
class CycleModality < ApplicationRecord
  belongs_to :academic_cycle
  belongs_to :modality

  has_many :cycle_turns, dependent: :restrict_with_error

  def name
    "#{academic_cycle.name} - #{modality.name}"
  end
end
