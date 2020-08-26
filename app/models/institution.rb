# frozen_string_literal: true

# Institution model
class Institution < ApplicationRecord
  # Belongs to associations ---------------------------------------------------
  belongs_to :status

  # Has many associations -----------------------------------------------------
  has_many :campuses, dependent: :restrict_with_error
  has_one :instution_address, dependent: :restrict_with_error

  # Validations ---------------------------------------------------------------
  validates :code, :name, presence: true
  validates :code, uniqueness: true, length: { minimum: 1, maximum: 16 }
  validates :name, length: { minimum: 1, maximum: 255 }
end
