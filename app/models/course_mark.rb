# frozen_string_literal: true

# Course mark model
class CourseMark < ApplicationRecord
  belongs_to :student_course
end
