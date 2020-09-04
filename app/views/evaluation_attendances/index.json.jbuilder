# frozen_string_literal: true

json.array! @evaluation_attendances, partial: 'evaluation_attendances/evaluation_attendance', as: :evaluation_attendance
