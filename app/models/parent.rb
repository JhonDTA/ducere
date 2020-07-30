class Parent < ApplicationRecord
  belongs_to :user

  delegate :name, to: :user
end
