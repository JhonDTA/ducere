# frozen_string_literal: true

# Homework mark model
class HomeworkMark < ApplicationRecord
  # Belongs to associations ---------------------------------------------------
  belongs_to :student_homework

  # Validations ---------------------------------------------------------------
  validates :student_homework_id, uniqueness: true
  validates :mark, presence: true, numericality: true
end
