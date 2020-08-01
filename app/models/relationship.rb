# frozen_string_literal: true

# Relationship model
class Relationship < ApplicationRecord
  # Belongs to associations ---------------------------------------------------
  belongs_to :status

  # Has many associations -----------------------------------------------------
  has_many :tutors, dependent: :restrict_with_error

  # Validations ---------------------------------------------------------------
end
