class Career < ApplicationRecord
  belongs_to :status

  has_many :level_careers
end
