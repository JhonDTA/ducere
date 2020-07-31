# frozen_string_literal: true

# Cycle type model
class CycleType < ApplicationRecord
  belongs_to :status
  has_many :academic_cycles, dependent: :restrict_with_error
end
