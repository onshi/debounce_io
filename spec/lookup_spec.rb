# frozen_string_literal: true

require 'spec_helper'

RSpec.describe DebounceIo::Lookup do
  let(:call) { described_class.call(email) }
  let(:email) { 'mohsen@gmail.com' }

  context 'with proper API calls', vcr: { cassette_name: 'lookup' } do
    it 'returns proper lookup values' do
      lookup = call

      expect(lookup.code).to eq('5')
      expect(lookup.email).to eq('mohsen@gmail.com')
      expect(lookup.free_email).to eq('true')
      expect(lookup.reason).to eq('Deliverable')
      expect(lookup.result).to eq('Safe to Send')
      expect(lookup.role).to eq('false')
      expect(lookup.send_transactional).to eq('1')
    end
  end

  context 'with proper API calls for extended lookup', vcr: { cassette_name: 'lookup_extended' } do
    let(:call) { described_class.call(email, append: true) }

    it 'returns proper lookup values' do
      lookup = call

      expect(lookup.code).to eq('5')
      expect(lookup.email).to eq('mohsen@gmail.com')
      expect(lookup.free_email).to eq('true')
      expect(lookup.reason).to eq('Deliverable')
      expect(lookup.result).to eq('Safe to Send')
      expect(lookup.role).to eq('false')
      expect(lookup.fullname).to eq('Mohsen Javdani')
      expect(lookup.firstname).to eq('Mohsen')
      expect(lookup.lastname).to eq('Javdani')
      expect(lookup.photo).to eq('https://lh3.googleusercontent.com/a-/AAuE7mChkYGFq_3AAacjlUZaQqfKnfiawLJno1EkDzWMoQ')
      expect(lookup.send_transactional).to eq('1')
    end
  end
end
