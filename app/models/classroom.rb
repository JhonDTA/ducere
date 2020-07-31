# frozen_string_literal: true

# Classroom model
class Classroom < ApplicationRecord
  belongs_to :building
  belongs_to :status
end
