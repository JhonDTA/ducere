# frozen_string_literal: true

# Grade model
class Grade < ApplicationRecord
  belongs_to :status

  has_many :syllabus_grades, dependent: :restrict_with_error
end
