# frozen_string_literal: true

# Grade model
class Grade < ApplicationRecord
  # Belongs to associations ---------------------------------------------------
  belongs_to :status
  # Has many associations -----------------------------------------------------
  has_many :syllabus_grades, dependent: :restrict_with_error
end
