# frozen_string_literal: true

# Modality model
class Modality < ApplicationRecord
  belongs_to :status

  has_many :cycle_modalities, dependent: :restrict_with_error
end
