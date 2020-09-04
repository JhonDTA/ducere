# frozen_string_literal: true

json.extract! cycle_modality, :id, :academic_cycle_id, :modality_id, :created_at, :updated_at
json.url cycle_modality_url(cycle_modality, format: :json)
