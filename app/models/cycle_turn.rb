# frozen_string_literal: true

# Cycle turn model
class CycleTurn < ApplicationRecord
  # Belongs to associations ---------------------------------------------------
  belongs_to :cycle_modality
  belongs_to :turn

  # Has many associations -----------------------------------------------------
  has_many :turn_evaluations, dependent: :restrict_with_error

  # Validations ---------------------------------------------------------------

  def name
    "#{cycle_modality.name} - #{turn.name}"
  end
end
