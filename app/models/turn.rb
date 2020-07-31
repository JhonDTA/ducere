# frozen_string_literal: true

# Turn model
class Turn < ApplicationRecord
  belongs_to :status

  has_many :cycle_turns, dependent: :restrict_with_error
end
