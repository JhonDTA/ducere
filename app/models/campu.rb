# frozen_string_literal: true

# Campus model
class Campu < ApplicationRecord
  validates :name, presence: true
  validates :school_id, presence: true
  belongs_to :school
end
