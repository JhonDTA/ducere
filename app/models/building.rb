class Building < ApplicationRecord
  belongs_to :campus
  belongs_to :status
end
