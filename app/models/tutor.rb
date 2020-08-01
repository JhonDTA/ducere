# frozen_string_literal: true

# Tutor model
class Tutor < ApplicationRecord
  # Belongs to associations ---------------------------------------------------
  belongs_to :student
  belongs_to :parent
  belongs_to :relationship

  # Validations ---------------------------------------------------------------
end
