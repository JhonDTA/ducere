# frozen_string_literal: true

json.array! @course_marks, partial: 'course_marks/course_mark', as: :course_mark
