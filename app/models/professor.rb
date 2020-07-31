class Professor < ApplicationRecord
  belongs_to :user

  validates :user_id, uniqueness: true

  delegate :name, to: :user

  def self.collection
    all.includes(:user)
  end
end
