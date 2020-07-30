class Group < ApplicationRecord
  belongs_to :status

  def self.collection
    all
  end
end
