# frozen_string_literal: true

json.extract! grade, :id, :name, :sequence, :description, :status_id, :created_at, :updated_at
json.url grade_url(grade, format: :json)
