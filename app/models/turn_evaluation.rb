# frozen_string_literal: true

# Turn evaluation model
class TurnEvaluation < ApplicationRecord
  # Belongs to associations ---------------------------------------------------
  belongs_to :cycle_turn
  belongs_to :evaluation_period

  # Has many associations -----------------------------------------------------
  has_many :campus_evaluations, dependent: :restrict_with_error

  # Validations ---------------------------------------------------------------

  def name
    "#{cycle_turn.name} - #{evaluation_period.name} periodo"
  end
end
