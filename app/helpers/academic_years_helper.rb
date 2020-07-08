# frozen_string_literal: true

# Academic year helper
module AcademicYearsHelper
  # @param [AcademicYear] academic_year
  # @return [String]
  def full_name(academic_year)
    "#{academic_year.campu.name} #{academic_year.start} - #{academic_year.finish}"
  end
end
