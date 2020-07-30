json.extract! student_course, :id, :student_id, :course_evaluation_id, :created_at, :updated_at
json.url student_course_url(student_course, format: :json)
