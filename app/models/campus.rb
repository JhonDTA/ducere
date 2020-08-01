# frozen_string_literal: true

# Campus model
class Campus < ApplicationRecord
  # Belongs to associations ---------------------------------------------------
  belongs_to :institution
  belongs_to :status

  # Has many associations -----------------------------------------------------
  has_many :buildings, dependent: :restrict_with_error

  # Validations ---------------------------------------------------------------
  validates :code, :name, presence: true
  validates :code, uniqueness: { scope: :institution_id },
                   length: { minimum: 1, maximum: 16 }
  validates :name, length: { minimum: 1, maximum: 255 }
end
