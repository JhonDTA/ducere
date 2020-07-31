# frozen_string_literal: true

# Campus model
class Campus < ApplicationRecord
  belongs_to :institution
  belongs_to :status

  has_many :buildings, dependent: :restrict_with_error
end
