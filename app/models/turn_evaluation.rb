class TurnEvaluation < ApplicationRecord
  belongs_to :cycle_turn
  belongs_to :evaluation_period

  def name
    "#{cycle_turn.name} - #{evaluation_period.name} periodo"
  end
end
