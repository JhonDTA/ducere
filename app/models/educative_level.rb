# frozen_string_literal: true

# Educative level model
class EducativeLevel < ApplicationRecord
  belongs_to :status

  has_many :level_careers, dependent: :restrict_with_exception
end
