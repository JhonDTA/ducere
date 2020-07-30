class Campus < ApplicationRecord
  belongs_to :institution
  belongs_to :status

  has_many :buildings
end
