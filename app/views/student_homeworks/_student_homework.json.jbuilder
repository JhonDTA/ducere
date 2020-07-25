json.extract! student_homework, :id, :course_homework_id, :student_id, :observations, :created_at, :updated_at
json.url student_homework_url(student_homework, format: :json)
