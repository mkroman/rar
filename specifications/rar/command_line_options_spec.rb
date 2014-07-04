require_relative '../spec_helper'

describe RAR::CommandLineOptions do
  describe '#to_a' do
    subject { RAR::CommandLineOptions.new.merge force: true }

    it 'returns a list' do
      expect(subject.to_a).to be_kind_of Array
    end

    it 'contains a list of command line options' do
      expect(subject.to_a).to include '-y'
    end


    it 'passes an :extra value if specified' do
      options = RAR::CommandLineOptions.new.merge extra: 'hello world'

      expect(options.to_a).to include 'hello world'
    end
  end
end
