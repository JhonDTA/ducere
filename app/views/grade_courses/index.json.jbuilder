# frozen_string_literal: true

json.array! @grade_courses, partial: 'grade_courses/grade_course', as: :grade_course
