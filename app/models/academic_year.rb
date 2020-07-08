# frozen_string_literal: true

# Academic year model
class AcademicYear < ApplicationRecord
  validates :start, presence: true
  validates :finish, presence: true
  validates :campu_id, presence: true
  belongs_to :campu
end
