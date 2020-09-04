# frozen_string_literal: true

json.array! @classrooms, partial: 'classrooms/classroom', as: :classroom
