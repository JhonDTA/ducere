# frozen_string_literal: true

json.array! @professors, partial: 'professors/professor', as: :professor
