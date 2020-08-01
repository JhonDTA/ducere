# frozen_string_literal: true

# Modality model
class Modality < ApplicationRecord
  # Belongs to associations ---------------------------------------------------
  belongs_to :status

  # Has many associations -----------------------------------------------------
  has_many :cycle_modalities, dependent: :restrict_with_error

  # Validations ---------------------------------------------------------------
end
