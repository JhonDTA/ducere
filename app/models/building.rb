# frozen_string_literal: true

# Building model
class Building < ApplicationRecord
  # Belongs to associations ---------------------------------------------------
  belongs_to :campus
  belongs_to :status

  # Has many associations -----------------------------------------------------
  has_many :classrooms, dependent: :restrict_with_error
  has_one :institution, through: :campus

  # Validations ---------------------------------------------------------------
  validates :code, presence: true
  validates :code, uniqueness: { scope: :campus_id },
                   length: { minimum: 1, maximum: 16 }

  def name
    "#{campus.name} - Edificio #{code}"
  end
end
