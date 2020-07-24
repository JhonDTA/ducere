class AcademicCycle < ApplicationRecord
  belongs_to :cycle_type
  belongs_to :status
end
