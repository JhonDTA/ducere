# frozen_string_literal: true

# Home evaluation model
class HomeworkEvaluation < ApplicationRecord
  # Belongs to associations ---------------------------------------------------
  belongs_to :student_homework

  # Validations ---------------------------------------------------------------
end
