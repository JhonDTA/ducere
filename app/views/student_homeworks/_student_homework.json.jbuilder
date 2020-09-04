# frozen_string_literal: true

json.extract! student_homework, :id, :student_id, :course_homework_id, :observations, :created_at, :updated_at
json.url student_homework_url(student_homework, format: :json)
