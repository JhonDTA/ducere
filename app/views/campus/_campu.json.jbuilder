# frozen_string_literal: true

json.extract! campu, :id, :name, :school_id, :created_at, :updated_at
json.url campu_url(campu, format: :json)
