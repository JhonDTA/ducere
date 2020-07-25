json.extract! homework_evaluation, :id, :student_homework_id, :mark, :observations, :created_at, :updated_at
json.url homework_evaluation_url(homework_evaluation, format: :json)
