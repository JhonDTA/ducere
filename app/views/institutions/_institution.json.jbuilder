# frozen_string_literal: true

json.extract! institution, :id, :name, :country_id, :created_at, :updated_at
json.url institution_url(institution, format: :json)
