# frozen_string_literal: true

# Building model
class Building < ApplicationRecord
  belongs_to :campus
  belongs_to :status

  has_many :classrooms, dependent: :restrict_with_error
end
