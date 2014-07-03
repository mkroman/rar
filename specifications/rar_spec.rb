require_relative 'spec_helper'

describe RAR do
  describe '#version' do
    it 'should return the version constant' do
      expect(RAR.version).to eq RAR::Version
    end
  end
end
