class Professor < ApplicationRecord
  belongs_to :user

  validates_uniqueness_of :user_id

  delegate :name, to: :user

  def self.collection
    all.includes(:user)
  end
end
