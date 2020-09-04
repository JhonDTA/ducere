# frozen_string_literal: true

json.extract! professor, :id, :user_id, :enrollment, :created_at, :updated_at
json.url professor_url(professor, format: :json)
