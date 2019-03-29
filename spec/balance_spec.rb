# frozen_string_literal: true

require 'spec_helper'

RSpec.describe DebounceIo::Balance do
  let(:call) { described_class.call }

  context 'with proper API calls', vcr: { cassette_name: 'balance' } do
    it 'returns proper balance value' do
      expect(call.balance).to eq('42')
    end
  end
end
