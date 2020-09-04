# frozen_string_literal: true

json.array! @student_courses, partial: 'student_courses/student_course', as: :student_course
