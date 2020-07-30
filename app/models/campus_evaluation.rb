class CampusEvaluation < ApplicationRecord
  belongs_to :campus
  belongs_to :turn_evaluation

  def name
    "#{campus.name} #{turn_evaluation.name}"
  end
end
