# frozen_string_literal: true

# School model
class School < ApplicationRecord
  validates :name, presence: true
  validates :code, presence: true, uniqueness: true,
                   length: { minimum: 1, maximum: 64 }
  belongs_to :country
end
