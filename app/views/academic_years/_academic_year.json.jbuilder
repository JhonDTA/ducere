# frozen_string_literal: true

json.extract! academic_year, :id, :start, :finish, :campu_id, :created_at, :updated_at
json.url academic_year_url(academic_year, format: :json)
