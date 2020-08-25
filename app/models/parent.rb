# frozen_string_literal: true

# Parent model
class Parent < ApplicationRecord
  # Belongs to associations ---------------------------------------------------
  belongs_to :user

  # Has many associations -----------------------------------------------------
  has_many :tutors, dependent: :restrict_with_error

  # Validations ---------------------------------------------------------------
  validates :user_id, uniqueness: true

  delegate :name, :avatar, to: :user
end
