# frozen_string_literal: true

# Classroom model
class Classroom < ApplicationRecord
  # Belongs to associations ---------------------------------------------------
  belongs_to :building
  belongs_to :status

  # Has many associations -----------------------------------------------------
  has_one :campus, through: :building
  has_one :institution, through: :campus

  # Validations ---------------------------------------------------------------
  validates :code, presence: true, uniqueness: { scope: :building_id },
                   length: { minimum: 1, maximum: 16 }
end
