# frozen_string_literal: true

json.array! @professor_courses, partial: 'professor_courses/professor_course', as: :professor_course
