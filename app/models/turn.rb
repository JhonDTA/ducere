# frozen_string_literal: true

# Turn model
class Turn < ApplicationRecord
  # Belongs to associations ---------------------------------------------------
  belongs_to :status

  # Has many associations -----------------------------------------------------
  has_many :cycle_turns, dependent: :restrict_with_error

  # Validations ---------------------------------------------------------------
  validates :code, :name, :start, :finish, presence: true
  validates :code, uniqueness: true, length: { minimum: 1, maximum: 16 }
  validates :name, length: { minimum: 1, maximum: 255 }
end
