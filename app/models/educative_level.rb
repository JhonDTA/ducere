# frozen_string_literal: true

# Educative level model
class EducativeLevel < ApplicationRecord
  # Belongs to associations ---------------------------------------------------
  belongs_to :status

  # Has many associations -----------------------------------------------------
  has_many :level_careers, dependent: :restrict_with_exception

  # Validations ---------------------------------------------------------------
end
