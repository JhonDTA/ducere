# frozen_string_literal: true

# Home evaluation model
class HomeworkEvaluation < ApplicationRecord
  belongs_to :student_homework
end
