# frozen_string_literal: true

json.extract! municipality, :id, :state_id, :name, :created_at, :updated_at
json.url municipality_url(municipality, format: :json)
