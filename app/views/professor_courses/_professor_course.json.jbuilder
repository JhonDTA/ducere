# frozen_string_literal: true

json.extract! professor_course, :id, :professor_id, :course_id, :created_at, :updated_at
json.url professor_course_url(professor_course, format: :json)
