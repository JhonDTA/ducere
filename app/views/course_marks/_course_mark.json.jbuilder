# frozen_string_literal: true

json.extract! course_mark, :id, :student_course_id, :mark, :attendance, :observations, :created_at, :updated_at
json.url course_mark_url(course_mark, format: :json)
