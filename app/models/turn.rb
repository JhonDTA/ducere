# frozen_string_literal: true

# Turn model
class Turn < ApplicationRecord
  # Belongs to associations ---------------------------------------------------
  belongs_to :status

  # Has many associations -----------------------------------------------------
  has_many :cycle_turns, dependent: :restrict_with_error

  # Validations ---------------------------------------------------------------
end
