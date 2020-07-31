# frozen_string_literal: true

# Career model
class Career < ApplicationRecord
  belongs_to :status

  has_many :level_careers, dependent: :restrict_with_error
end
