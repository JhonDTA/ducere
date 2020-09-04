# frozen_string_literal: true

json.extract! currency, :id, :iso_code, :name, :symbol, :created_at, :updated_at
json.url currency_url(currency, format: :json)
