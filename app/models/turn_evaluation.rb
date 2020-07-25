class TurnEvaluation < ApplicationRecord
  belongs_to :cycle_turn
  belongs_to :evaluation_period
end
