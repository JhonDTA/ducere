# frozen_string_literal: true

# Turn evaluation model
class TurnEvaluation < ApplicationRecord
  belongs_to :cycle_turn
  belongs_to :evaluation_period

  has_many :campus_evaluations, dependent: :restrict_with_error

  def name
    "#{cycle_turn.name} - #{evaluation_period.name} periodo"
  end
end
