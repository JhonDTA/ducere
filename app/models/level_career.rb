class LevelCareer < ApplicationRecord
  belongs_to :educative_level
  belongs_to :career

  def name
    "#{educative_level.name} #{career.name}"
  end
end
