class CampusEvaluation < ApplicationRecord
  belongs_to :campus
  belongs_to :turn_evaluation
end
