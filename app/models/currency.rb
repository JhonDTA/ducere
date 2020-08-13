# frozen_string_literal: true

# Currency model
class Currency < ApplicationRecord
  # Validations ---------------------------------------------------------------
  validates :name, :iso_code, :symbol, presence: true
  validates :iso_code, uniqueness: true, length: { is: 3 }
  validates :name, length: { maximum: 255 }
  validates :symbol, length: { minimun: 1, maximum: 8 }

  default_scope { order(iso_code: :asc) }
end
