# frozen_string_literal: true

json.extract! institution_address, :id, :institution_id, :address_id, :created_at, :updated_at
json.url institution_address_url(institution_address, format: :json)
