# frozen_string_literal: true

# Campus address model
class CampusAddress < ApplicationRecord
  # Belongs to associations ---------------------------------------------------
  belongs_to :campus
  belongs_to :address
end
