# frozen_string_literal: true

# Country model
class Country < ApplicationRecord
  # Has many associations -----------------------------------------------------
  has_many :states, dependent: :restrict_with_error

  # Validations ---------------------------------------------------------------
  validates :name, :iso_code, presence: true
  validates :iso_code, uniqueness: true, length: { minimum: 2, maximum: 4 }
  validates :calling_code, length: { maximum: 10 }
end
