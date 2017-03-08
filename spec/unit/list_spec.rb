RSpec.describe(Dry::Monads::List) do
  list = described_class

  subject { list[1, 2, 3] }

  describe '#inspect' do
    it 'dumps list to string' do
      expect(subject.inspect).to eql('List[1, 2, 3]')
    end
  end

  describe '#to_s' do
    it 'dumps list to string' do
      expect(subject.to_s).to eql('List[1, 2, 3]')
    end

    it 'acts as #inspect' do
      expect(subject.to_s).to eql(subject.inspect)
    end
  end

  describe '#==' do
    it 'compares two lists' do
      expect(subject).to eq(list[1, 2, 3])
    end
  end

  describe '#eql?' do
    it 'compares two lists with hash equality' do
      expect(subject).to eql(list[1, 2, 3])
    end
  end

  describe '#+' do
    it 'concatenates two lists' do
      expect(subject).to eql(list[1, 2] + list[3])
    end
  end

  describe '#to_a' do
    it 'coerces list to array' do
      expect(subject.to_a).to eql([1, 2, 3])
    end
  end

  describe '#to_ary' do
    it 'coerces list to array' do
      expect(subject.to_ary)
    end

    it 'allows to split list' do
      a, *b = subject
      expect(a).to eql(1)
      expect(b).to eql([2, 3])
    end
  end
end