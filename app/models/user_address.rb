# frozen_string_literal: true

# User address model
class UserAddress < ApplicationRecord
  # Belongs to associations ---------------------------------------------------
  belongs_to :user
  belongs_to :address
end
