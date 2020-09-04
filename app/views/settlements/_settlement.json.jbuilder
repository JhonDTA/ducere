# frozen_string_literal: true

json.extract! settlement, :id, :municipality_id, :name, :zip_code, :created_at, :updated_at
json.url settlement_url(settlement, format: :json)
