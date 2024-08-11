RSpec.describe ParameterNormalizer::Normalizer do
  describe '#as_integer' do
    subject { described_class.new.as_integer(value) }

    context 'integer string' do
      let(:value) { '123' }

      it { expect(subject).to eq 123 }
    end

    context 'float string' do
      let(:value) { '3.14' }

      it { expect(subject).to be_nil }
    end

    context 'string' do
      let(:value) { 'abc' }

      it { expect(subject).to be_nil }
    end
  end

  describe '#as_integer_array' do
    subject { described_class.new.as_integer_array(value) }

    context 'number string' do
      let(:value) { '123' }

      it { expect(subject).to match_array [123] }
    end

    context 'number string array' do
      let(:value) { %w[12 34] }

      it { expect(subject).to match_array [12, 34] }
    end
  end

  describe '#as_integer_hash' do
    subject { described_class.new.as_integer_hash(value) }

    context 'hash' do
      let(:value) do
        {
          '0': '12',
          '1': '34',
          '3': '56'
        }
      end

      let(:expected) do
        {
          '0': 12,
          '1': 34,
          '3': 56
        }
      end

      it { expect(subject).to eq expected }
    end
  end

  describe '#as_boolean' do
    subject { described_class.new.as_boolean(value) }

    context 'string 1' do
      let(:value) { '1' }

      it { expect(subject).to be true }
    end

    context 'integer 1' do
      let(:value) { 1 }

      it { expect(subject).to be true }
    end

    context 'bool true' do
      let(:value) { true }

      it { expect(subject).to be true }
    end

    context 'string true' do
      let(:value) { 'true' }

      it { expect(subject).to be true }
    end

    context 'bool false' do
      let(:value) { false }

      it { expect(subject).to be false }
    end

    context 'string false' do
      let(:value) { 'false' }

      it { expect(subject).to be false }
    end

    context 'other' do
      let(:value) { 'abc' }

      it { expect(subject).to be false }
    end
  end

  describe '#as_datetime' do
    subject { described_class.new.as_datetime(value) }

    context 'datetime string' do
      let(:value) { '2021-01-01 12:34:56' }

      it { expect(subject).to eq Time.zone.parse('2021-01-01 12:34:56') }
    end

    context 'date string' do
      let(:value) { '2021-02-01' }

      it { expect(subject).to eq Time.zone.parse('2021-02-01 00:00:00') }
    end

    context 'invalid string' do
      let(:value) { 'abc' }

      it { expect(subject).to be_nil }
    end
  end

  describe '#as_datetime' do
    subject { described_class.new.as_date(value) }

    context 'datetime string' do
      let(:value) { '2021-01-01 12:34:56' }

      it { expect(subject).to eq Date.parse('2021-01-01') }
    end

    context 'date string' do
      let(:value) { '2021-02-01' }

      it { expect(subject).to eq Date.parse('2021-02-01') }
    end

    context 'invalid string' do
      let(:value) { 'abc' }

      it { expect(subject).to be_nil }
    end
  end
end
