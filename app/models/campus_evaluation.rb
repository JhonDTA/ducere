# frozen_string_literal: true

# Campus evaluatio model
class CampusEvaluation < ApplicationRecord
  belongs_to :campus
  belongs_to :turn_evaluation

  has_many :course_evaluations, dependent: :restrict_with_error

  def name
    "#{campus.name} #{turn_evaluation.name}"
  end

  def self.collection
    all.includes(
        [{ turn_evaluation:
               [{ cycle_turn:
                      [{ cycle_modality: %i[academic_cycle modality] }, :turn]
                }, :evaluation_period] }, :campus])
  end
end
