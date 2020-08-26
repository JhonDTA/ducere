# frozen_string_literal: true

# Institution address model
class InstutionAddress < ApplicationRecord
  # Belongs to associations ---------------------------------------------------
  belongs_to :institution
  belongs_to :address
end
