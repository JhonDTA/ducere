# frozen_string_literal: true

# Career syllabus model
class CareerSyllabus < ApplicationRecord
  belongs_to :level_career
  belongs_to :syllabus

  has_many :syllabus_grades, dependent: :restrict_with_error

  def name
    "#{level_career.name} #{syllabus.code}"
  end
end
