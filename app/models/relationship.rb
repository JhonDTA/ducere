# frozen_string_literal: true

# Relationship model
class Relationship < ApplicationRecord
  belongs_to :status

  has_many :tutors, dependent: :restrict_with_error
end
