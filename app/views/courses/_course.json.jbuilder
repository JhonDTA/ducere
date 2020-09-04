# frozen_string_literal: true

json.extract! course, :id, :code, :name, :description, :credits, :status_id, :created_at, :updated_at
json.url course_url(course, format: :json)
