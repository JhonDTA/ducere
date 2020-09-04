# frozen_string_literal: true

json.extract! institution, :id, :code, :name, :description, :status_id, :created_at, :updated_at
json.url institution_url(institution, format: :json)
