# frozen_string_literal: true

# Attendance type model
class AttendanceType < ApplicationRecord
  belongs_to :status

  has_many :evaluation_attendances, dependent: :restrict_with_error
end
