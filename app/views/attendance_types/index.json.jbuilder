# frozen_string_literal: true

json.array! @attendance_types, partial: 'attendance_types/attendance_type', as: :attendance_type
