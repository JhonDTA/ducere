class Student < ApplicationRecord
  belongs_to :user

  delegate :name, to: :user
end
