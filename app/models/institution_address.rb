# frozen_string_literal: true

# Institution address model
class InstitutionAddress < ApplicationRecord
  # Belongs to associations ---------------------------------------------------
  belongs_to :institution
  belongs_to :address
end
