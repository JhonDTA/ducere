# frozen_string_literal: true

# Group model
class Group < ApplicationRecord
  # Belongs to associations ---------------------------------------------------
  belongs_to :status

  # Has many associations -----------------------------------------------------
  has_many :course_evaluations, dependent: :restrict_with_error

  # Validations ---------------------------------------------------------------

  def self.collection
    all
  end
end
