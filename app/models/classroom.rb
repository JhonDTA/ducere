class Classroom < ApplicationRecord
  belongs_to :building
  belongs_to :status
end
