# frozen_string_literal: true

# User model
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable

  # Has many associations -----------------------------------------------------
  has_one :parent, dependent: :restrict_with_error
  has_one :professor, dependent: :restrict_with_error
  has_one :student, dependent: :restrict_with_error
  has_one_attached :avatar

  # Validations ---------------------------------------------------------------
  validates :avatar, content_type: { in: %w[image/jpeg image/gif image/png],
                                     message: 'must be a valid format' },
                     size: { less_than: 5.megabytes,
                             message: 'should be less than 5 megabytes' }

  def name
    "#{first_name} #{last_name} #{second_last_name}"
  end

  # @return [TrueClass, FalseClass]
  def student?
    Student.find_by(user: self).present?
  end

  # @return [TrueClass, FalseClass]
  def professor?
    Professor.find_by(user: self).present?
  end

  # @return [TrueClass, FalseClass]
  def parent?
    Parent.find_by(user: self).present?
  end
end
