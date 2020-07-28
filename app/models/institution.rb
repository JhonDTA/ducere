class Institution < ApplicationRecord
  belongs_to :country
  belongs_to :status
  has_many :campuses
end
