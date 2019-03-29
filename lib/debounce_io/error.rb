# frozen_string_literal: true

module DebounceIo
  module Error
    # Custom error class for rescuing from all DebounceIo errors.
    class Error < StandardError; end

    # Raised when API endpoint credentials are not configured or bad.
    class WrongCredentials < Error; end

    # Raised when impossible to parse response body.
    class Parsing < Error; end

    # Raised when DebounceIo API response status equals 0.
    class API < Error; end
  end
end
