# frozen_string_literal: true

# Cycle turn model
class CycleTurn < ApplicationRecord
  belongs_to :cycle_modality
  belongs_to :turn

  has_many :turn_evaluations, dependent: :restrict_with_error

  def name
    "#{cycle_modality.name} - #{turn.name}"
  end
end
