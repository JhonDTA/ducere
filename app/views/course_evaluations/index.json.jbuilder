# frozen_string_literal: true

json.array! @course_evaluations, partial: 'course_evaluations/course_evaluation', as: :course_evaluation
