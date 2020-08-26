# frozen_string_literal: true

# Address model
class Address < ApplicationRecord
  # Belongs to associations ---------------------------------------------------
  belongs_to :settlement

  # Validations ---------------------------------------------------------------
  validates :street, presence: true, length: { minimum: 1, maximum: 255 }
  validates :interior_number, :exterior_number, length: { maximum: 50 }
end
