# frozen_string_literal: true

json.array! @user_addresses, partial: 'user_addresses/user_address', as: :user_address
