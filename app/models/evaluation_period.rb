# frozen_string_literal: true

# Evaluation period model
class EvaluationPeriod < ApplicationRecord
  belongs_to :status

  has_many :turn_evaluations, dependent: :restrict_with_error
end
