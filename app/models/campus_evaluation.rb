class CampusEvaluation < ApplicationRecord
  belongs_to :campus
  belongs_to :turn_evaluation

  has_many :course_evaluations

  def name
    "#{campus.name} #{turn_evaluation.name}"
  end
end
