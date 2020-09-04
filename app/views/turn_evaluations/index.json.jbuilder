# frozen_string_literal: true

json.array! @turn_evaluations, partial: 'turn_evaluations/turn_evaluation', as: :turn_evaluation
