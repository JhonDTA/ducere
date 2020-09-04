# frozen_string_literal: true

json.extract! syllabus_grade, :id, :syllabus_id, :grade_id, :created_at, :updated_at
json.url syllabus_grade_url(syllabus_grade, format: :json)
