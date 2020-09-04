# frozen_string_literal: true

json.extract! cycle_turn, :id, :cycle_modality_id, :turn_id, :created_at, :updated_at
json.url cycle_turn_url(cycle_turn, format: :json)
