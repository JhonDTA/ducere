# frozen_string_literal: true

# Municipality model
class Municipality < ApplicationRecord
  # Belongs to associations ---------------------------------------------------
  belongs_to :state

  # Has many associations -----------------------------------------------------
  has_many :settlements, dependent: :restrict_with_error

  # Validations ---------------------------------------------------------------
  validates :name, presence: true, uniqueness: { scope: :state_id },
                   length: { minimum: 1, maximum: 255 }
end
