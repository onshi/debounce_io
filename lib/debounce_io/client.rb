# frozen_string_literal: true

require 'json'
require 'net/http'

module DebounceIo
  module Client
    extend self

    BASE_ENDPOINT = 'https://api.debounce.io/v1/'
    API_KEY = ENV.fetch('DEBOUNCE_IO_API_KEY') { '' }

    def get(path: '', params: {})
      build_request_uri(path, params)
        .then { |uri| submit(uri) }
        .then { |response| decode(response.body) }
        .then { |response| validate(response) }
    end

    private

    def build_request_uri(path, params)
      uri = URI.parse(BASE_ENDPOINT + path)
      uri.query = URI.encode_www_form(params.merge(api: API_KEY))
      uri
    end

    def submit(uri)
      Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |http|
        request = Net::HTTP::Get.new(uri)
        http.request(request)
      end
    end

    def decode(response)
      JSON.parse(response)
    rescue JSON::ParserError
      raise Error::Parsing
    end

    def validate(response)
      case response['success']
      when '0' then parse_error(response['debounce'])
      when '1' then response['debounce']
      when nil then response
      end
    end

    def parse_error(error_hash)
      case error_hash['code']
      when '0' then raise Error::WrongCredentials, "DebounceIo error: #{error_hash['error']}"
      else raise Error::API, error_hash['error']
      end
    end
  end
end
