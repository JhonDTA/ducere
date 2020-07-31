# frozen_string_literal: true

# Level career model
class LevelCareer < ApplicationRecord
  belongs_to :educative_level
  belongs_to :career

  has_many :career_syllabuses, dependent: :restrict_with_error

  def name
    "#{educative_level.name} #{career.name}"
  end
end
