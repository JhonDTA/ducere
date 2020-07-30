class CareerSyllabus < ApplicationRecord
  belongs_to :level_career
  belongs_to :syllabus

  def name
    "#{level_career.name} #{syllabus.code}"
  end
end
