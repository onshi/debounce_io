# frozen_string_literal: true

require 'spec_helper'

RSpec.describe DebounceIo::Client do
  let(:call) { described_class.get }

  context 'without email param', vcr: { cassette_name: 'without_email' } do
    let(:call) { described_class.get }

    it 'raises WrongCredentials error' do
      expect { call }.to raise_error(DebounceIo::Error::API, 'Email is Required')
    end
  end
end
