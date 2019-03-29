# frozen_string_literal: true

require 'ostruct'

module DebounceIo
  module Lookup
    extend self

    DEFAULT_APPEND_MODE = false
    LOOKUP_PROPERTIES = %w[email code role free_email result reason
                           send_transactional fullname firstname lastname photo].freeze

    def call(email, append: DEFAULT_APPEND_MODE)
      params = {
        email: email,
        append: append
      }

      Client.get(params: params)
            .then { |lookup_hash| sanitize_lookup_params(lookup_hash) }
            .then { |sanitized_params| OpenStruct.new(sanitized_params) }
    end

    private

    def sanitize_lookup_params(lookup_hash)
      lookup_hash.slice(*LOOKUP_PROPERTIES)
    end
  end
end
