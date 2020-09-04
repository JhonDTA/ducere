# frozen_string_literal: true

json.extract! syllabus, :id, :code, :name, :description, :approval_credits, :status_id, :created_at, :updated_at
json.url syllabus_url(syllabus, format: :json)
