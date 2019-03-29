# frozen_string_literal: true

require 'ostruct'

module DebounceIo
  module Balance
    extend self

    BALANCE_PARAMS = { action: 'balance' }.freeze
    BALANCE_PROPERTIES = %w[balance].freeze

    def call
      Client.get(params: BALANCE_PARAMS)
            .then { |balance_hash| sanitize_balance_params(balance_hash) }
            .then { |sanitized_params| OpenStruct.new(sanitized_params) }
    end

    private

    def sanitize_balance_params(balance_hash)
      balance_hash.slice(*BALANCE_PROPERTIES)
    end
  end
end
