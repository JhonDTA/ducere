# frozen_string_literal: true

# Institution model
class Institution < ApplicationRecord
  belongs_to :country
  belongs_to :status

  has_many :campuses
end
