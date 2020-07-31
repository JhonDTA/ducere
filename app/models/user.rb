# frozen_string_literal: true

# User model
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable

  has_many :parents, dependent: :restrict_with_error
  has_many :professors, dependent: :restrict_with_error
  has_many :students, dependent: :restrict_with_error
  has_one_attached :avatar

  validates :avatar, content_type: { in: %w[image/jpeg image/gif image/png],
                                     message: 'must be a valid format' },
            size: { less_than: 5.megabytes,
                    message: 'should be less than 5 megabytes' }

  def name
    "#{first_name} #{last_name} #{second_last_name}"
  end
end
