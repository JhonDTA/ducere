class Tutor < ApplicationRecord
  belongs_to :student
  belongs_to :parent
  belongs_to :relationship
end
