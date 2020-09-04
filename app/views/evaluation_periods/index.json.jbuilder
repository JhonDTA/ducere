# frozen_string_literal: true

json.array! @evaluation_periods, partial: 'evaluation_periods/evaluation_period', as: :evaluation_period
