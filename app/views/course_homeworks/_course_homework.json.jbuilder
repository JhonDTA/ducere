json.extract! course_homework, :id, :course_evaluation_id, :name, :description, :created_at, :updated_at
json.url course_homework_url(course_homework, format: :json)
