# frozen_string_literal: true

# Academic cycle
class AcademicCycle < ApplicationRecord
  # Belongs to associations ---------------------------------------------------
  belongs_to :cycle_type
  belongs_to :status

  # Has many associations -----------------------------------------------------
  has_many :cycle_modalities, dependent: :restrict_with_error

  # Validations ---------------------------------------------------------------
  validates :code, :name, :start, :finish,
            presence: true
  validates :code, uniqueness: true, length: { minimum: 3, maximum: 16 }
  validates :name, length: { minimum: 1, maximum: 255 }

  # @param [CycleType] cycle_type
  # @param [Date] start_date
  # @return [String]
  def self.create_code(cycle_type, start_date)
    finish_date = start_date + cycle_type.duration.days
    cycles_per_year = (360 / cycle_type.duration).floor
    code = cycle_type.code[0..2]

    if cycles_per_year == 1
      "#{code}#{start_date.strftime('%Y')}-#{finish_date.strftime('%Y')}"
    else
      "#{code}#{start_date.strftime('%m%y')}-#{finish_date.strftime('%m%y')}"
    end
  end
end
