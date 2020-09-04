# frozen_string_literal: true

json.array! @homework_marks, partial: 'homework_marks/homework_mark', as: :homework_mark
