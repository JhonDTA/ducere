# frozen_string_literal: true

json.array! @course_homeworks, partial: 'course_homeworks/course_homework', as: :course_homework
