# frozen_string_literal: true

json.array! @academic_years, partial: 'academic_years/academic_year', as: :academic_year
