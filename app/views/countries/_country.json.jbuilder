# frozen_string_literal: true

json.extract! country, :id, :name, :iso_code, :calling_code, :created_at, :updated_at
json.url country_url(country, format: :json)
