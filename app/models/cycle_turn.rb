class CycleTurn < ApplicationRecord
  belongs_to :cycle_modality
  belongs_to :turn

  has_many :turn_evaluations

  def name
    "#{cycle_modality.name} - #{turn.name}"
  end
end
