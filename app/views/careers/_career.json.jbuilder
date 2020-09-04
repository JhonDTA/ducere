# frozen_string_literal: true

json.extract! career, :id, :code, :name, :description, :educative_level_id, :status_id, :created_at, :updated_at
json.url career_url(career, format: :json)
