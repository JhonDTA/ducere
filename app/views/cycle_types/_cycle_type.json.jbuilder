# frozen_string_literal: true

json.extract! cycle_type, :id, :code, :name, :description, :duration, :status_id, :created_at, :updated_at
json.url cycle_type_url(cycle_type, format: :json)
