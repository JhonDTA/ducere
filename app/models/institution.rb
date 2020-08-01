# frozen_string_literal: true

# Institution model
class Institution < ApplicationRecord
  # Belongs to associations ---------------------------------------------------
  belongs_to :country
  belongs_to :status

  # Has many associations -----------------------------------------------------
  has_many :campuses, dependent: :restrict_with_error

  # Validations ---------------------------------------------------------------
end
