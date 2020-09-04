# frozen_string_literal: true

json.array! @turns, partial: 'turns/turn', as: :turn
