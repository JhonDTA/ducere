# frozen_string_literal: true

json.array! @campus_evaluations, partial: 'campus_evaluations/campus_evaluation', as: :campus_evaluation
