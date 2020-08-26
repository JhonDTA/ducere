# frozen_string_literal: true

# State model
class State < ApplicationRecord
  # Belongs to associations ---------------------------------------------------
  belongs_to :country

  # Has many associations -----------------------------------------------------
  has_many :municipalities, dependent: :restrict_with_error

  # Validations ---------------------------------------------------------------
  validates :name, presence: true, uniqueness: { scope: :country_id },
                   length: { minimum: 1, maximum: 255 }
end
