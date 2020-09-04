# frozen_string_literal: true

json.array! @student_homeworks, partial: 'student_homeworks/student_homework', as: :student_homework
