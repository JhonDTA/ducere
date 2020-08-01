# frozen_string_literal: true

# Campus evaluatio model
class CampusEvaluation < ApplicationRecord
  # Belongs to associations ---------------------------------------------------
  belongs_to :campus
  belongs_to :turn_evaluation

  # Has many associations -----------------------------------------------------
  has_many :course_evaluations, dependent: :restrict_with_error

  # Validations ---------------------------------------------------------------
  validates :turn_evaluation_id, uniqueness: { scope: :campus_id }

  def name
    "#{campus.name} #{turn_evaluation.name}"
  end

  def self.collection
    all.includes([{ turn_evaluation: [{ cycle_turn:
                                            [{ cycle_modality: %i[academic_cycle modality] },
                                             :turn] }, :evaluation_period] }, :campus])
  end
end
