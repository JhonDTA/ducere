class CycleType < ApplicationRecord
  belongs_to :status
  has_many :academic_cycles
end
