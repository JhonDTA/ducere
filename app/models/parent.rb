# frozen_string_literal: true

# Parent model
class Parent < ApplicationRecord
  belongs_to :user

  has_many :tutors, dependent: :restrict_with_error

  delegate :name, to: :user
end
