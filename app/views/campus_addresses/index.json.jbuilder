# frozen_string_literal: true

json.array! @campus_addresses, partial: 'campus_addresses/campus_address', as: :campus_address
