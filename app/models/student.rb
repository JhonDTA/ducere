# frozen_string_literal: true

# Student model
class Student < ApplicationRecord
  # Belongs to associations ---------------------------------------------------
  belongs_to :user
  # Has many associations -----------------------------------------------------
  has_many :student_courses, dependent: :restrict_with_error
  has_many :student_homeworks, dependent: :restrict_with_error
  has_many :tutors, dependent: :restrict_with_error

  # Validations ---------------------------------------------------------------
  validates :enrollment, presence: true
  validates :user_id, :enrollment, uniqueness: true
  validates :enrollment, length: { minimum: 1, maximum: 32 }

  delegate :name, :avatar, to: :user

  def current_career
    career = Career.joins()
  end
end
