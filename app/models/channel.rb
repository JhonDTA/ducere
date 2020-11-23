# frozen_string_literal: true

class Channel < ApplicationRecord
  has_many :channel_users, dependent: :destroy
  has_many :users, through: :channel_users
  has_many :messages, dependent: :delete_all

  validates :name, presence: true

  def unreads_count(user)
    channel_user = channel_users.find_by(user: user)
    channel_user.present? ? channel_user.unreads.count : 0
  end
end
