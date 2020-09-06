# frozen_string_literal: true

json.array! @institution_addresses, partial: 'institution_addresses/institution_address', as: :institution_address
