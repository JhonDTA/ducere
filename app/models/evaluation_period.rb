# frozen_string_literal: true

# Evaluation period model
class EvaluationPeriod < ApplicationRecord
  # Belongs to associations ---------------------------------------------------
  belongs_to :status

  # Has many associations -----------------------------------------------------
  has_many :turn_evaluations, dependent: :restrict_with_error

  # Validations ---------------------------------------------------------------
end
