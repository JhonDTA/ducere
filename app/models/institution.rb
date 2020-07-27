class Institution < ApplicationRecord
  belongs_to :country
  belongs_to :status
end
