require_relative '../spec_helper'

describe RAR::Archive do
  describe 'default attributes' do
    it "has a list of files" do
      expect(subject.files).to be_kind_of Array
    end

    it "has a list of options" do
      expect(subject.options).to be_kind_of Hash
    end
  end

  describe '#add_file' do
    context 'when the file exists' do
      it 'adds the file' do
        subject.add_file __FILE__

        expect(subject.files).to include __FILE__
      end
    end

    context 'when the file does not exist' do
      it 'raises an error' do
        expect { subject.add_file 'a__b__2___c' }.to raise_error Errno::ENOENT
      end
    end
  end
end
