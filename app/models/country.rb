# frozen_string_literal: true

# Country model
class Country < ApplicationRecord
  validates :name, presence: true
  validates :iso_code, presence: true, uniqueness: true,
                       length: { minimum: 2, maximum: 4 }
  validates :calling_code, presence: false, length: { minimum: 0, maximum: 10 }
end
