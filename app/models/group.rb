# frozen_string_literal: true

# Group model
class Group < ApplicationRecord
  belongs_to :status

  has_many :course_evaluations, dependent: :restrict_with_error

  def self.collection
    all
  end
end
