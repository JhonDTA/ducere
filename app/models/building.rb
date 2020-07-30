class Building < ApplicationRecord
  belongs_to :campus
  belongs_to :status

  has_many :classrooms
end
