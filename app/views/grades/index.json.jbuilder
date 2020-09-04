# frozen_string_literal: true

json.array! @grades, partial: 'grades/grade', as: :grade
