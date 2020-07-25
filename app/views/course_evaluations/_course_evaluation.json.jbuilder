json.extract! course_evaluation, :id, :grade_course_id, :campus_evaluation_id, :professor_id, :group_id, :created_at, :updated_at
json.url course_evaluation_url(course_evaluation, format: :json)
