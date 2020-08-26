# frozen_string_literal: true

# Settlement model
class Settlement < ApplicationRecord
  # Belongs to associations ---------------------------------------------------
  belongs_to :municipality

  # Has many associations -----------------------------------------------------
  has_many :addresses, dependent: :restrict_with_error

  # Validations ---------------------------------------------------------------
  validates :zip_code, presence: true,
                       uniqueness: { scope: %i[municipality_id name] }
  validates :name, length: { minimum: 1, maximum: 255 }
  validates :zip_code, length: { minimum: 1, maximum: 16 }
end
