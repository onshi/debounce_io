# frozen_string_literal: true

require 'bundler/setup'
require 'vcr'

ENV['DEBOUNCE_IO_API_KEY'] = 'yolo-debounce-api-key'

VCR.configure do |config|
  config.cassette_library_dir = 'spec/vcr_cassettes'
  config.hook_into :webmock
  config.configure_rspec_metadata!
end

RSpec.configure do |config|
  config.example_status_persistence_file_path = '.rspec_status'

  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

require 'debounce_io'
